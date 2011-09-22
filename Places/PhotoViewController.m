//
//  PhotoViewController.m
//  Places
//
//  Created by James Whittaker on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"


@implementation PhotoViewController
@synthesize imageData;



- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{

    UIImage* img = [[UIImage alloc] initWithData:self.imageData];
    iv = [[UIImageView alloc] initWithImage:img];
    
    UIScrollView* sv = [[UIScrollView alloc] init];
    [sv addSubview:iv]; 
    sv.contentSize = img.size;
    sv.minimumZoomScale = 0.3;
    sv.maximumZoomScale = 2.0;
    
    sv.delegate = self;
    //CGRect r = CGRectMake(0, 0, img.size.width / 2, img.size.height);
    //[sv zoomToRect:r animated:NO];
    self.view = sv;
    [sv release];   
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return iv;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
