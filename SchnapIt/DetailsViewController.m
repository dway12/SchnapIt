//
//  DetailsViewController.m
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

+(id) instance {
    static DetailsViewController *inst = NULL;
    @synchronized(self) {
        if (inst == NULL) {
            inst = [[self alloc] initWithNibName:nil bundle:nil];
        }
    }
    return inst;
}

-(void) setProduct:(Product*) prod {
    product = prod;
    [self.view setNeedsLayout]; // possibly hackish way to tell it to refresh?
    self.title = [prod name];
    [image setImage:[prod image]];
    
    
    double currency = [prod price]; 
    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithInt:currency]];
    price.text = [NSString stringWithFormat:@"%@",numberAsString];

    
    
    stars.text = [NSString stringWithFormat:@"%i stars", [prod rating]];
    summary.text = [prod summary];
    
    [image.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [image.layer setBorderWidth: 1.0];
    [[image layer] setCornerRadius:15];
 

    [[summary layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[summary layer] setBorderWidth:1.0];
    [[summary layer] setCornerRadius:15];
    [summary setClipsToBounds: YES];
}

- (void)viewDidLoad
{
    self.title = @"Product Info";
    [buybutton addTarget:self action:@selector(doBuy:) forControlEvents:UIControlEventTouchUpInside];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) doBuy:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [product buyURL]]];
}

- (void)viewDidUnload
{
    [image release];
    image = nil;
    [buybutton release];
    buybutton = nil;
    [price release];
    price = nil;
    [stars release];
    stars = nil;
    [summary release];
    summary = nil;
    [image release];
    image = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [image release];
    [buybutton release];
    [price release];
    [stars release];
    [summary release];
    [image release];
    [super dealloc];
}
@end
