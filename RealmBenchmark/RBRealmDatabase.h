//
//  RBRealmDatabase.h
//  RealmBenchmark
//
//  Created by Pierre on 28/07/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBRealmModel.h"
#import "RBDatabase.h"

@interface RBRealmDatabase : RBDatabase
@property (nonatomic, retain) RLMRealm * realm;
@end
