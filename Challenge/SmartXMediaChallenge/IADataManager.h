//
//  NSDataManager.h
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/20/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAAppDelegate.h"

@interface IADataManager : NSObject

@property (strong, nonatomic) IAAppDelegate *cdHelper;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObject *table;
@property (strong, nonatomic) NSFetchRequest *fetchRequest;
@property (strong, nonatomic) NSEntityDescription *entity;

-(instancetype)initWithTableName:(NSString *)tableName;

@end
