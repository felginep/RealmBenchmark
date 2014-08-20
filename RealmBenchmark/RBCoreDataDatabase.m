//
//  RBCoreDataDatabase.m
//  RealmBenchmark
//
//  Created by Pierre on 28/07/2014.
//  Copyright (c) 2014 Felginep. All rights reserved.
//

#import "RBCoreDataDatabase.h"
#import "RBCoreDataModel.h"

@implementation RBCoreDataDatabase

- (void)setup {
    NSManagedObjectModel * managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"RealmBenchmark" withExtension:@"momd"]];

    NSPersistentStoreCoordinator * persistantStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    [persistantStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self _storeURL] options:nil error:NULL];

    NSManagedObjectContext * managedObjectContext = [[NSManagedObjectContext alloc] init];
    managedObjectContext.persistentStoreCoordinator = persistantStoreCoordinator;

    self.managedObjectContext = managedObjectContext;
}

- (void)beginTransaction {

}

- (void)commitTransaction {
    [self.managedObjectContext save:NULL];
}

- (void)insertObject:(NSString *)string {
    CDPerson * person = (CDPerson *)[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    person.name = [NSString stringWithFormat:@"Person number %@", string];
    person.birthdate = [NSDate date];
}

- (NSArray *)queryAll {
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    request.predicate = nil; // all objects
    return [self.managedObjectContext executeFetchRequest:request error:NULL];
}

- (NSArray *)querySort:(NSString *)key {
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    NSSortDescriptor * sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:YES];
    request.sortDescriptors = @[sortDescriptor];
    return  [self.managedObjectContext executeFetchRequest:request error:NULL];
}

- (NSArray *)queryWithPredicate:(NSPredicate *)predicate {
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    request.predicate = predicate;
    return [self.managedObjectContext executeFetchRequest:request error:NULL];
}

- (void)deleteObject:(id)object {
    [self.managedObjectContext deleteObject:object];
}

- (void)tearDown {
    [[NSFileManager defaultManager] removeItemAtPath:[self _storeURL].path error:NULL];
    self.managedObjectContext = nil;
}

#pragma mark - Private methods

- (NSURL *)_storeURL {
    return [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", self.name]];
}

@end
