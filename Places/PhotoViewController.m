//
//  PhotoViewController.m
//  Places
//
//  Created by James Whittaker on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"


@implementation PhotoViewController
@synthesize imageData, scrollView, image;



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


#pragma mark - Positioning




#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{

    image = [[UIImage alloc] initWithData:self.imageData];
    imageView = [[UIImageView alloc] initWithImage:image];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.scrollView addSubview:imageView]; 
    self.scrollView.contentSize = image.size;    
    self.scrollView.delegate = self;    
    self.view = self.scrollView;
    [self.scrollView release];   
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageView;
}

- (void)centerImageInScrollView:(UIScrollView *)scrollView
{
	CGFloat offsetX = (self.scrollView.bounds.size.width > self.scrollView.contentSize.width)? 
	(self.scrollView.bounds.size.width - self.scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (self.scrollView.bounds.size.height > self.scrollView.contentSize.height)? 
	(self.scrollView.bounds.size.height - self.scrollView.contentSize.height) * 0.5 : 0.0;
    imageView.center = CGPointMake(self.scrollView.contentSize.width * 0.5 + offsetX, 
                                   self.scrollView.contentSize.height * 0.5 + offsetY);	
}

- (void)setInitialZoom:(UIScrollView *)scrollView
{
	CGSize scrollSize = self.scrollView.bounds.size;
	CGFloat widthRatio = scrollSize.width / self.image.size.width;
	CGFloat heightRatio = scrollSize.height / self.image.size.height;
	CGFloat initialZoom = (widthRatio > heightRatio) ? heightRatio : widthRatio;
	self.scrollView.minimumZoomScale = initialZoom;
	self.scrollView.maximumZoomScale = 2.0;
	self.scrollView.zoomScale = initialZoom;
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerImageInScrollView:self.scrollView];
}


- (void)viewWillAppear:(BOOL)animated
{
	[self centerImageInScrollView:self.scrollView];
	[self setInitialZoom:self.scrollView];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[self centerImageInScrollView:self.scrollView];
	[self setInitialZoom:self.scrollView];
}

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
