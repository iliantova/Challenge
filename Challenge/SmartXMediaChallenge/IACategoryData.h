//
//  IACategoryData.h
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/20/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IADataManager.h"

@interface IACategoryData : NSObject

@property (strong, nonatomic) IADataManager *db;

-(instancetype) init;

-(NSArray*) TakeAllCategoryFromDatabase;

-(void) SaveCategoryInDatabaseFromArrayOfObject: (NSArray*) arrayWithCategory;

@end
