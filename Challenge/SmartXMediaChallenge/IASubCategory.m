//
//  IASubCategory.m
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/18/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import "IASubCategory.h"

@implementation IASubCategory

-(instancetype) initWithName: (NSString *) name
             andIdSubCategory:(NSString *) idSubCategory
            andIdBaseCategory:(NSString *) idBaseCategory
                andCoverImage:(UIImage *) coverImage
{
    if(self = [super init]){
        self.name = name;
        self.idSubCategory = idSubCategory;
        self.idBaseCategory = idBaseCategory;
        self.coverImage = coverImage;
    }
    return self;
}

+(IASubCategory*) subCategoryWithName: (NSString *) name
                     andIdSubCategory:(NSString *) idSubCategory
                    andIdBaseCategory:(NSString *) idBaseCategory
                        andCoverImage:(UIImage *) coverImage

{
    return [[IASubCategory alloc] initWithName:name
                              andIdSubCategory:idSubCategory
                             andIdBaseCategory:idBaseCategory
                                 andCoverImage:coverImage];
}


@end
