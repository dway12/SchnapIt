//
//  TagViewController.h
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagView.h"
#import "Box.h"
#import "ObjectsListViewController.h"

@interface TagViewController : UIViewController{
    
    IBOutlet TagView *annotationView;
    NSMutableDictionary *dictionaryBox;
    IBOutlet UIBarButtonItem *doneButton;
    IBOutlet UIBarButtonItem *addButton;
    IBOutlet UIBarButtonItem *deleteButton;
    IBOutlet UIImageView *imageView;
    
    IBOutlet UIToolbar *topToolbar;
    IBOutlet UIToolbar *bottomToolbar;
    
    NSArray *colorArray;
    
    BOOL move;
    BOOL size;
    BOOL keyboardVisible;
    
    CGPoint firstLocation;
    int selectedBox;
    int corner;
    int numLabels;
    
    
    ObjectsListViewController*  objectsListViewController;
    
    
}

@property (retain, nonatomic) ObjectsListViewController* objectsListViewController;
@property (retain, nonatomic) IBOutlet TagView *annotationView;
@property (retain, nonatomic) NSArray *colorArray;

@property (retain, nonatomic) NSMutableDictionary *dictionaryBox;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *deleteButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@property (nonatomic, retain) IBOutlet UIToolbar *topToolbar;
@property (nonatomic, retain) IBOutlet UIToolbar *bottomToolbar;


-(IBAction)addAction:(id)sender;
-(IBAction)deleteAction:(id)sender;
-(IBAction)doneAction:(id)sender;

-(void)setImage:(UIImage *)image;

@end