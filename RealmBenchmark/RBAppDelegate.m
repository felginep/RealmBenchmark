//
//  RBAppDelegate.m
//  RealmBenchmark
//
//  Created by Pierre on 28/07/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBAppDelegate.h"
#import "RBCoreDataDatabase.h"
#import "RBRealmDatabase.h"
#import "RBPerformanceTest.h"
#import <objc/runtime.h>

@interface RBAppDelegate ()
- (NSArray *)_testClassNames;
- (NSTimeInterval)_measure:(void(^)(void))block;
- (NSTimeInterval)_measureTime:(void(^)(void))block;
@end

@implementation RBAppDelegate

#define RB_MESURE_ITERATIONS 1


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    RBRealmDatabase * realmBenchmark = [[RBRealmDatabase alloc] initWithName:@"RBRealm"];
    RBCoreDataDatabase * coreDataBenchmark = [[RBCoreDataDatabase alloc] initWithName:@"RBCoreData"];

    NSArray * benchmarks = @[coreDataBenchmark, realmBenchmark];

    for (RBDatabase * benchmark in benchmarks) {
        NSLog(@"%@", benchmark.name);
        for (NSString * testClassName in [self _testClassNames]) {
            NSLog(@"  %@", testClassName);
            Class testClass = NSClassFromString(testClassName);
            RBPerformanceTest * test = [[testClass alloc] initWithBenchmark:benchmark];
            for (NSString * testMethod in [NSClassFromString(testClassName) testMethods]) {
                [test setup];
                NSTimeInterval time = [self _measureTime:^{
                    [test performSelector:NSSelectorFromString(testMethod)];
                }];
                NSLog(@"    %@ : %f", testMethod, time);
                [test tearDown];
            }
        }
    }


    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}

#pragma mark - Private methods

- (NSArray *)_testClassNames {
    NSMutableArray * testClassesArray = [NSMutableArray array];
    int numClasses = objc_getClassList(NULL, 0);
    if (numClasses > 0) {
        Class * classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            NSString * className = NSStringFromClass(classes[i]);
            if ([className hasPrefix:@"RBTest"] && [classes[i] superclass] == [RBPerformanceTest class]) {
                [testClassesArray addObject:className];
            }
        }
        free(classes);
    }
    return testClassesArray;
}

- (NSTimeInterval)_measure:(void(^)(void))block {
    NSTimeInterval total = 0;
    for (int i = 0; i < RB_MESURE_ITERATIONS; i++) {
        total += [self _measureTime:block];
    }
    return total / RB_MESURE_ITERATIONS;
}

- (NSTimeInterval)_measureTime:(void(^)(void))block {
    NSDate * start = [NSDate date];
    block();
    NSDate * end = [NSDate date];
    return [end timeIntervalSinceDate:start];
}

@end
