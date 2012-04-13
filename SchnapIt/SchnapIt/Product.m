//
//  Product.m
//  SchnapIt
//
//  Created by DAVID HAYDEN on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize name = _name;
@synthesize summary = _summary;
@synthesize buyURL = _buyURL;
@synthesize rating = _rating;
@synthesize price = _price;
@synthesize image = _image;


-(id) initWithTitle:(NSString *)name 
               buyURL:(NSString *)buyURL 
              summary:(NSString *)summary 
             rating:(int)rating 
              price:(float)price
                image:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.name = name;
        self.buyURL = buyURL;
        self.summary = summary;
        self.rating = rating%6;
        self.price = price;
        self.image = image;
    }
    return self;
}

+(id) getMacbookLaptop {
    return [[Product alloc] initWithTitle:@"Macbook Pro" 
                                   buyURL:@"http://www.apple.com" 
                                  summary:@"The newest Macbook yet --Apple Tautology Dept" 
                                   rating:5 
                                    price:2199.00
                                    image:[UIImage imageNamed:@"macbook_laptop.jpg"]];
}

+(id) getLenovoLaptop {
    return [[Product alloc] initWithTitle:@"Lenovo X200" 
                                   buyURL:@"http://www.lenovo.com" 
                                  summary:@"The same, classic looks you've come to expect from as far back as you can remember..." 
                                   rating:3 
                                    price:1199.99
                                    image:[UIImage imageNamed:@"lenovo_laptop.jpg"]]; 
}


@end
