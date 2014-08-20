//
//  RBTestQuery.m
//  RealmBenchmark
//
//  Created by Pierre on 20/08/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBTestQuery.h"

@implementation RBTestQuery

- (void)setup {
    [super setup];
    [self.benchmark insert:100000];
}

- (void)testQueryAll {
    [self.benchmark queryAll];
}

- (void)testQuerySort {
    [self.benchmark querySort:@"name"];
}

- (void)testQueryPredicate {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"name BEGINSWITH %@", @"Person number 1"];
    [self.benchmark queryWithPredicate:predicate];
}

- (void)tearDown {
    [super tearDown];
}

@end
