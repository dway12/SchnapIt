//
//  DetailsViewController.h
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface DetailsViewController : UIViewController {
    Product *product;
}

+(id) instance;
-(void) setProduct:(Product*) prod;

@end
