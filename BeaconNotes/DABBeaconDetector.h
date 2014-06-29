//
//  DABBeaconDetector.h
//  BeaconNotes
//
//  Created by Drew Breunig on 6/28/14.
//  Copyright (c) 2014 Drew Breunig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@protocol DABBeaconDetectorDelegate;

@interface DABBeaconDetector : NSObject <CLLocationManagerDelegate>

@property (nonatomic, weak) id <DABBeaconDetectorDelegate> delegate;
@property (nonatomic, strong) NSString *udid;
@property (nonatomic) BOOL beaconInRange;

@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
@property (nonatomic, strong) CLLocationManager *locationManager;

- (id)initWithUDID:(NSString*)udid;

@end

/////////////////////////////////////////////////
#pragma mark - Beacon Detector Delegate Protocol

@protocol DABBeaconDetectorDelegate

- (void)beaconOutsideRange;
- (void)beaconInsideRange;

@end