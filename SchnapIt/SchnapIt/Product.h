//
//  Product.h
//  SchnapIt
//
//  Created by DAVID HAYDEN on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Product : NSObject {
    NSString *_name;
    NSString *_buyURL;
    NSString *_summary;
    int _rating;
    UIImage *_image;
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * buyURL;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic) int rating;
@property (nonatomic, retain) UIImage * image;

-(id) initWithTitle:(NSString *)name 
             buyURL:(NSString *)buyURL 
            summary:(NSString *)summary 
             rating:(int)rating 
              image:(UIImage *)image;

+(id) getMacbookLaptop;
+(id) getLenovoLaptop;

@end