//
//  TopPlacesViewController.h
//  Places
//
//  Created by James Whittaker on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TopPlacesViewController : UITableViewController {
    NSArray* topPlaces;
}

- (id)initWithTabBar;

@end
