//
//  IASubSubCategory.h
//  SmartXMediaChallenge
//
//  Created by Iliyana Antova on 5/18/16.
//  Copyright © 2016 Iliyana Antova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IASubSubCategory : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* idSubCategory;
@property (strong, nonatomic) NSString* idSubSubCategory;

-(instancetype) initWithName: (NSString *) name
            andIdSubSubCategory:(NSString *) idSubSubCategory
            andIdSubCategory:(NSString *) idSubCategory;


+(IASubSubCategory*) subCategoryWithName: (NSString *) name
                     andIdSubSubCategory:(NSString *) idSubSubCategory
                     andIdSubCategory:(NSString *) idSubCategory;

@end
