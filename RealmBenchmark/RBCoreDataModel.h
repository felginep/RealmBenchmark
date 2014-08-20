//
//  RBCoreDataModel.h
//  RealmBenchmark
//
//  Created by Pierre on 15/08/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDDog;

@interface CDPerson : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * birthdate;
@property (nonatomic, retain) NSSet *dogs;
@end

@interface CDPerson (CoreDataGeneratedAccessors)

- (void)addDogsObject:(CDDog *)value;
- (void)removeDogsObject:(CDDog *)value;
- (void)addDogs:(NSSet *)values;
- (void)removeDogs:(NSSet *)values;

@end

@interface CDDog : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) CDPerson *owner;

@end
