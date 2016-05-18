//
//  IACategory.h
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/18/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IACategory : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* idCategory;

-(instancetype) initWithName: (NSString *) name
              andIdCategory:(NSString *) idCategory;

+(IACategory*) categoryWithName: (NSString *) name
     andIdCategory:(NSString *) idCategory;

@end
