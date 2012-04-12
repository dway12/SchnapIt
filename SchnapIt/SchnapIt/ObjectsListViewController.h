//
//  ObjectsListViewController.h
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "DetailsViewController.h"

@interface ObjectsListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView* productsTable;
    NSMutableArray *products;
}

@property (nonatomic, retain) UITableView* productsTable;

- (void) addProduct:(id)product;

@end