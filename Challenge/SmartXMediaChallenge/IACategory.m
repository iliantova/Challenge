//
//  IACategory.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/18/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "IACategory.h"

@implementation IACategory

-(instancetype)initWithName: (NSString *)name
             andIdCategory:(NSString *)idCategory
{
    if(self = [super init]){
        self.name = name;
        self.idCategory = idCategory;
    }
    return self;
}

+(IACategory*) categoryWithName: (NSString *) name
     andIdCategory:(NSString *) idCategory

{
    return [[IACategory alloc] initWithName:name
                      andIdCategory:idCategory];
}

@end
