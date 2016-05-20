//
//  IACategoryData.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/20/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "IACategoryData.h"
#import "IACategory.h"

@implementation IACategoryData

-(instancetype)init{
    self = [super init];
    if (self) {
        
        //self.db = [[IADataManager alloc]initWithTableName: @"Category"];
    }
    return self;
}

-(NSArray*) TakeAllCategoryFromDatabase{

    NSError *error;
    
    IADataManager *db = [[IADataManager alloc]initWithTableName: @"Category"];
    
    NSArray *result = [db.context executeFetchRequest:db.fetchRequest error:&error];
    
    NSMutableArray *fetchedObjects =[[NSMutableArray alloc] init];
    
    for (NSManagedObject *info in result) {
        NSString *n = [info valueForKey:@"name"];
        NSString *m = [info valueForKey:@"id"];
        
        IACategory *category = [IACategory categoryWithName:n andIdCategory:m];
        [fetchedObjects addObject: category];
    }
    NSArray *arrayWithCategory = fetchedObjects;
    
    return arrayWithCategory;
}

-(void) SaveCategoryInDatabaseFromArrayOfObject: (NSArray*) arrayWithCategory
{
    for (NSDictionary *dictionary in arrayWithCategory) {
        IADataManager *db = [[IADataManager alloc]initWithTableName: @"Category"];
        NSError *error;
        
        NSString *n = [dictionary objectForKey:@"category_id"];
        NSString *m = [dictionary objectForKey:@"category_name"];
        
        NSArray *categoryInBase = [self TakeAllCategoryFromDatabase];
        BOOL nothaveSameCategory = TRUE;
        for (NSDictionary *category in categoryInBase) {
            IACategory *compare = category;
            if ([compare.idCategory isEqualToString:n]) {
                nothaveSameCategory = false;
            }
        }
        
        if ([n isKindOfClass:[NSNull class]]) {
            nothaveSameCategory = false;
        }
        
        if (nothaveSameCategory) {
            
            [db.table setValue:n forKey:@"id"];
            [db.table setValue:m forKey:@"name"];
            if (![db.context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }

        }
    }
}

@end
