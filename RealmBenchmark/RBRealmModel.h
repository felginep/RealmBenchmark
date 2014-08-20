//
//  RBRealmModel.h
//  RealmBenchmark
//
//  Created by Pierre on 28/07/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@class RPerson;

@interface RDog : RLMObject

@property NSString * name;
@property RPerson   * owner;

@end

RLM_ARRAY_TYPE(RDog)


@interface RPerson : RLMObject

@property NSString      * name;
@property NSDate        * birthdate;
@property RLMArray<RDog> * dogs;

@end

