//
//  DABNavigationViewController.m
//  BeaconNotes
//
//  Created by Drew Breunig on 6/28/14.
//  Copyright (c) 2014 Drew Breunig. All rights reserved.
//

#import "DABNavigationViewController.h"

@interface DABNavigationViewController ()

@end

@implementation DABNavigationViewController

- (UIViewController*)lockScreen
{
    if ( _lockScreen )
        return _lockScreen;
    _lockScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"lockScreen"];
    return _lockScreen;
}

/////////////////////////////////////////////////
#pragma mark - Beacon Management

- (DABBeaconDetector*)beaconManager
{
    if ( _beaconManager )
        return _beaconManager;
    _beaconManager = [[DABBeaconDetector alloc] initWithUDID:@"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"];
    return _beaconManager;
}

- (void)beaconInsideRange
{
    if ( [self.lockScreen presentingViewController] ) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)beaconOutsideRange
{
    if ( ![self.lockScreen presentingViewController] ) {
        [self presentViewController:self.lockScreen animated:YES completion:nil];
    }
}

/////////////////////////////////////////////////
#pragma mark - Build Up, Tear Down

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.beaconManager.delegate = self;
}


@end
