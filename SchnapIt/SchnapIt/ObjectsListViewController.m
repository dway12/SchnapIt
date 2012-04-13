//
//  ObjectsListViewController.m
//  SchnapIt
//
//  Created by David Way on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ObjectsListViewController.h"

@interface ObjectsListViewController ()

@end

@implementation ObjectsListViewController

@synthesize productsTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        products = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addProduct:(id)product {
    // add product to products if it isn't already contained in it.
    NSString* pname = [product name];
    for (int i=0;i<[products count]; i++) {
        if ([pname isEqualToString:[[products objectAtIndex:i] name]]) return;
    }
    [products addObject:product];
}

- (void)viewDidLoad
{
    self.title = @"Schnaps";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma Table View Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [products count];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.productsTable reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [products removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    Product *p = [products objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    cell.textLabel.text = [p name];
    cell.imageView.image = [p image];
    NSString *detailLabel = [NSString stringWithFormat:@"   Price: $%.2f  Rating: %d/%d", [p price], [p rating], 5];
    cell.detailTextLabel.text = detailLabel;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsViewController *dvController = [DetailsViewController instance];
    [dvController setProduct:[products objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:dvController animated:YES];
}

@end
