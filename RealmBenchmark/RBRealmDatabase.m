//
//  RBRealmDatabase.m
//  RealmBenchmark
//
//  Created by Pierre on 28/07/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBRealmDatabase.h"
#import <Realm/Realm.h>

@implementation RBRealmDatabase

- (void)setup {
    NSURL * url = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.realm", self.name]];
    self.realm = [RLMRealm realmWithPath:url.path];
}

- (void)beginTransaction {
    [self.realm beginWriteTransaction];
}

- (void)commitTransaction {
    [self.realm commitWriteTransaction];
}

- (void)insertObject:(NSString *)string {
    RPerson * person = [[RPerson alloc] init];
    person.name = [NSString stringWithFormat:@"Person number %@", string];
    person.birthdate = [NSDate date];
    [self.realm addObject:person];
}

- (RLMArray *)queryAll {
    return [RPerson allObjectsInRealm:self.realm];
}

- (RLMArray *)querySort:(NSString *)key {
    return [[RPerson allObjectsInRealm:self.realm] arraySortedByProperty:key ascending:YES];
}

- (RLMArray *)queryWithPredicate:(NSPredicate *)predicate {
    return [RPerson objectsInRealm:self.realm withPredicate:predicate];
}

- (void)deleteObject:(id)object {
    [self.realm deleteObject:object];
}

- (void)tearDown {
    [[NSFileManager defaultManager] removeItemAtPath:self.realm.path error:NULL];
    self.realm = nil;
}

@end
