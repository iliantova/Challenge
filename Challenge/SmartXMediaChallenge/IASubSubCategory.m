//
//  IASubSubCategory.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/18/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "IASubSubCategory.h"

@implementation IASubSubCategory

-(instancetype) initWithName: (NSString *) name
            andIdSubSubCategory:(NSString *) idSubSubCategory
           andIdSubCategory:(NSString *) idSubCategory

{
    if(self = [super init]){
        self.name = name;
        self.idSubSubCategory = idSubSubCategory;
        self.idSubCategory = idSubCategory;
    }
    return self;
}

+(IASubSubCategory*) subCategoryWithName: (NSString *) name
                     andIdSubSubCategory:(NSString *) idSubSubCategory
                    andIdSubCategory:(NSString *) idSubCategory

{
    return [[IASubSubCategory alloc] initWithName:name
                              andIdSubSubCategory:idSubSubCategory
                             andIdSubCategory:idSubCategory];
}


@end
