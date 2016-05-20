//
//  IASubCategory.h
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/18/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface IASubCategory : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* idBaseCategory;
@property (strong, nonatomic) NSString* idSubCategory;
@property (strong, nonatomic) UIImage* coverImage;

-(instancetype) initWithName: (NSString *) name
               andIdSubCategory:(NSString *) idSubCategory
           andIdBaseCategory:(NSString *) idBaseCategory
               andCoverImage:(UIImage *) coverImage;

+(IASubCategory*) subCategoryWithName: (NSString *) name
            andIdSubCategory:(NSString *) idSubCategory
           andIdBaseCategory:(NSString *) idBaseCategory
               andCoverImage:(UIImage *) coverImage;

@end
