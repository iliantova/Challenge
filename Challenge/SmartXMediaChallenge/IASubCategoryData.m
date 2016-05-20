//
//  IASubCategoryData.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/20/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "IASubCategoryData.h"
#import "IASubCategory.h"
#import "IADataManager.h"

@implementation IASubCategoryData

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSArray*) TakeSubCategoryByCategoryFromDatabase: (IACategory*) category
{
    
    NSError *error;
    
    IADataManager *db = [[IADataManager alloc]initWithTableName: @"SubCategory"];
    
    NSArray *result = [db.context executeFetchRequest:db.fetchRequest error:&error];
    
    NSMutableArray *fetchedObjects =[[NSMutableArray alloc] init];
    
    for (NSManagedObject *info in result) {
        
        NSString *name = [info valueForKey:@"name"];
        NSString *subId = [info valueForKey:@"id"];
        NSString *cover = [info valueForKey:@"cover"];
        NSString *categoryId = [info valueForKey:@"idCategory"];
        
        NSString *imageUrl = @"https://tvc.mobiletv.bg/sxm/images/subcategory/";
        
        NSString *allUrl = [NSString stringWithFormat:@"%@%@", imageUrl, cover];
        NSURL *url = [NSURL URLWithString:allUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        
        if ([categoryId isEqualToString: category.idCategory]) {
            IASubCategory *subcategory = [IASubCategory subCategoryWithName:name andIdSubCategory:subId andIdBaseCategory:categoryId andCoverImage:img];
            [fetchedObjects addObject: subcategory];
        }
    }
    NSArray *arrayWithSubCategory = fetchedObjects;
    
    return arrayWithSubCategory;
}

-(NSArray*) TakeAllSubCategoryFromDatabase
{
    
    NSError *error;
    
    IADataManager *db = [[IADataManager alloc]initWithTableName: @"SubCategory"];
    
    NSArray *result = [db.context executeFetchRequest:db.fetchRequest error:&error];
    
    return result;
}


-(void) SaveSubCategoryInDatabaseFromArrayOfObject: (NSArray*) arrayWithSubCategory
{
    for (NSDictionary *dictionary in arrayWithSubCategory) {
        IADataManager *db = [[IADataManager alloc]initWithTableName: @"SubCategory"];
        NSError *error;
        
        NSString *subid = [dictionary objectForKey:@"subcategory_id"];
        NSString *subname= [dictionary objectForKey:@"subcategory_name"];
        NSString *categoryid = [dictionary objectForKey:@"category_id"];
        NSString *cover= [dictionary objectForKey:@"cover"];
        
        NSArray *subcategoryInBase = [self TakeAllSubCategoryFromDatabase];
        BOOL nothaveSameCategory = TRUE;
        if ([subid isKindOfClass:[NSNull class]]) {
            nothaveSameCategory = false;
        }
        for (NSDictionary *subcategory in subcategoryInBase) {
            NSString *compareId = [subcategory valueForKey:@"id"];
            if ([compareId isEqualToString: subid]) {
                nothaveSameCategory = false;
            }
        }
        if (nothaveSameCategory) {
            
            [db.table setValue:subid forKey:@"id"];
            [db.table setValue:subname forKey:@"name"];
            [db.table setValue:categoryid forKey:@"idCategory"];
            [db.table setValue:cover forKey:@"cover"];
            if (![db.context save:&error]) {
                NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
            }
            
        }
    }
}

@end
