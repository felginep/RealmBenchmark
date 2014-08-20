//
//  RBTestInsert.m
//  RealmBenchmark
//
//  Created by Pierre on 20/08/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBTestInsert.h"

@implementation RBTestInsert

- (void)testInsertAll {
    [self.benchmark insert:10000];
}

- (void)testInserOneByOne {
    [self.benchmark insertOne:10000];
}

@end
