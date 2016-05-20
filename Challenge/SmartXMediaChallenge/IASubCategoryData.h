//
//  IASubCategoryData.h
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/20/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IACategory.h"

@interface IASubCategoryData : NSObject

-(instancetype) init;

-(NSArray*) TakeSubCategoryByCategoryFromDatabase: (IACategory*) category;

-(NSArray*) TakeAllSubCategoryFromDatabase;

-(void) SaveSubCategoryInDatabaseFromArrayOfObject: (NSArray*) arrayWithSubCategory;

@end
