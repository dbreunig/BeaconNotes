//
//  DABNavigationViewController.h
//  BeaconNotes
//
//  Created by Drew Breunig on 6/28/14.
//  Copyright (c) 2014 Drew Breunig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DABBeaconDetector.h"

@interface DABNavigationViewController : UINavigationController <DABBeaconDetectorDelegate>

@property (nonatomic, strong) DABBeaconDetector *beaconManager;
@property (nonatomic, strong) UIViewController *lockScreen;

@end
