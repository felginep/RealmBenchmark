//
//  RBTestDeletion.m
//  RealmBenchmark
//
//  Created by Pierre on 20/08/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBTestDeletion.h"

@interface RBTestDeletion ()
@property (nonatomic, strong) id<NSFastEnumeration> objects;
@end

@implementation RBTestDeletion

- (void)setup {
    [super setup];
    [self.benchmark insert:10000];
    self.objects = [self.benchmark queryAll];
}

- (void)testDeletionAll {
    [self.benchmark deleteObjects:self.objects];
}

@end
