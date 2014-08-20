//
//  RBDatabase.h
//  RealmBenchmark
//
//  Created by Pierre on 28/07/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBDatabase : NSObject

@property (nonatomic, retain) NSString * name;

- (id)initWithName:(NSString *)name;
- (void)setup;
- (void)beginTransaction;
- (void)commitTransaction;
- (void)insertObject:(NSString *)string;
- (void)insert:(int)n;
- (void)insertOne:(int)n;
- (id)queryAll;
- (id)querySort:(NSString *)key;
- (id)queryWithPredicate:(NSPredicate *)predicate;
- (void)deleteObject:(id)object;
- (void)deleteObjects:(id<NSFastEnumeration>)objects;
- (void)tearDown;
- (NSURL *)applicationDocumentsDirectory;
@end
