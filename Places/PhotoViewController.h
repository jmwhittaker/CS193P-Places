//
//  PhotoViewController.h
//  Places
//
//  Created by James Whittaker on 21/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoViewController : UIViewController <UIScrollViewDelegate> {
    UIImageView* iv;
}

@property (copy) NSData* imageData;

@end
