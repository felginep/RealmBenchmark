//
//  RBPerformanceTest.m
//  RealmBenchmark
//
//  Created by Pierre on 20/08/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBPerformanceTest.h"
#import <objc/runtime.h>

@implementation RBPerformanceTest

+ (NSArray *)testMethods {
    NSMutableArray * selectors = [NSMutableArray array];
    unsigned int methodsCount = 0;
    Method * methods = class_copyMethodList(self, &methodsCount);
    for (int i = 0; i < methodsCount; i++) {
        NSString * methodName = NSStringFromSelector(method_getName(methods[i]));
        if ([methodName hasPrefix:@"test"]) {
            [selectors addObject:methodName];
        }
    }
    return selectors;
}

- (instancetype)initWithBenchmark:(RBDatabase *)benchmark {
    if (self = [super init]) {
        self.benchmark = benchmark;
    }
    return self;
}

- (void)setup {
    [self.benchmark setup];
}

- (void)tearDown {
    [self.benchmark tearDown];
}

@end
