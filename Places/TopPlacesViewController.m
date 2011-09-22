//
//  TopPlacesViewController.m
//  Places
//
//  Created by James Whittaker on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TopPlacesViewController.h"
#import "PhotosAtPlaceViewController.h"
#import "FlickrFetcher.h"

@interface TopPlacesViewController()
@property (nonatomic, retain) NSArray* topPlaces;
@end 

@implementation TopPlacesViewController

@synthesize topPlaces;

- (NSArray *)topPlaces {
    
    if (!topPlaces) {
		NSSortDescriptor *sort = [[[NSSortDescriptor alloc] initWithKey:@"_content" ascending:YES] autorelease];
		topPlaces = [[[FlickrFetcher topPlaces] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]] retain];
	}
	return topPlaces; 
}


- (id)initWithTabBar {
    if ([self init]) {
        
    }
    
    return self;
}

- (void)dealloc
{
    [topPlaces release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    
    //NSLog(@"%@", self.topPlaces);
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.topPlaces count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    NSString* place = [[self.topPlaces objectAtIndex:indexPath.row] objectForKey:@"_content"];
    NSRange range = [place rangeOfString:@","];
    NSString* placeName = [place substringToIndex:range.location];
    NSString* metaName = [place substringFromIndex:range.location + 2];
    
    cell.textLabel.text = placeName;
    cell.detailTextLabel.text = metaName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     NSSortDescriptor *sort = [[[NSSortDescriptor alloc] initWithKey:@"_content" ascending:YES] autorelease];
     topPlaces = [[[FlickrFetcher topPlaces] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]] retain];
     */
    
    //NSSortDescriptor *sort = [[[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES] autorelease];
    
    PhotosAtPlaceViewController* pvc = [[PhotosAtPlaceViewController alloc] init];
    pvc.photosAtLocationArray = [FlickrFetcher photosAtPlace:[[self.topPlaces objectAtIndex:indexPath.row] objectForKey:@"place_id"]];

    [self.navigationController pushViewController:pvc animated:YES];
    [pvc release];
    
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
