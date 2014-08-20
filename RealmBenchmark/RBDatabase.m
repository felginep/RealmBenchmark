//
//  RBDatabase.m
//  RealmBenchmark
//
//  Created by Pierre on 28/07/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBDatabase.h"

@implementation RBDatabase

- (id)initWithName:(NSString *)name {
    if (self = [super init]) {
        self.name = name;
    }
    return self;
};

- (void)setup {}

- (void)beginTransaction {}

- (void)commitTransaction {}

- (void)insertObject:(NSString *)string { }

- (void)insert:(int)n {
    [self beginTransaction];
    for (int i = 0; i < n; i++) {
        [self insertObject:[NSString stringWithFormat:@"%i", i]];
    }
    [self commitTransaction];
}

- (void)insertOne:(int)n {
    for (int i = 0; i < n; i++) {
        [self beginTransaction];
        [self insertObject:[NSString stringWithFormat:@"%i", i]];
        [self commitTransaction];
    }
}

- (id)queryAll { return nil; }

- (id)querySort:(NSString *)key { return nil; }

- (id)queryWithPredicate:(NSPredicate *)predicate { return nil; }

- (void)deleteObject:(id)object {}

- (void)deleteObjects:(id<NSFastEnumeration>)objects {
    [self beginTransaction];
    for (id object in objects) {
        [self deleteObject:object];
    }
    [self commitTransaction];
}

- (void)tearDown {}

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
