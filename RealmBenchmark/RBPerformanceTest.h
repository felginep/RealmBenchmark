//
//  RBPerformanceTest.h
//  RealmBenchmark
//
//  Created by Pierre on 20/08/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBDatabase.h"

@interface RBPerformanceTest : NSObject

@property (nonatomic, strong) RBDatabase * benchmark;

+ (NSArray *)testMethods;

- (instancetype)initWithBenchmark:(RBDatabase *)benchmark;
- (void)setup;
- (void)tearDown;

@end
