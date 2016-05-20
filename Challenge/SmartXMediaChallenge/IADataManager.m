//
//  NSDataManager.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/20/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "IADataManager.h"

@implementation IADataManager

-(instancetype)initWithTableName:(NSString *)tableName{
    self = [super init];
    if (self) {
        
        self.cdHelper = [[IAAppDelegate alloc] init];
        self.context = [self.cdHelper managedObjectContext];
        self.table = [NSEntityDescription
                                          insertNewObjectForEntityForName:tableName
                                          inManagedObjectContext:self.context];
        self.fetchRequest = [[NSFetchRequest alloc] init];
        self.entity = [NSEntityDescription
                                       entityForName:tableName inManagedObjectContext:self.context];
        [self.fetchRequest setEntity:self.entity];
        [self.fetchRequest setReturnsObjectsAsFaults:NO];
        	
    }
    return self;
}

@end
