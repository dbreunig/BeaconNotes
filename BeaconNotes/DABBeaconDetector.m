//
//  DABBeaconDetector.m
//  BeaconNotes
//
//  Created by Drew Breunig on 6/28/14.
//  Copyright (c) 2014 Drew Breunig. All rights reserved.
//

#import "DABBeaconDetector.h"

@implementation DABBeaconDetector

/////////////////////////////////////////////////
#pragma mark - Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    for ( CLBeacon *beacon in beacons ) {
        if ( beacon.rssi < -60 ) {
            [self.delegate beaconOutsideRange];
        } else {
            [self.delegate beaconInsideRange];
        }
    }
    if ( beacons.count == 0 )
        [self.delegate beaconOutsideRange];
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    NSLog(@"Ranging Error: %@", error);
}

/////////////////////////////////////////////////
#pragma mark - Initialization

- (id)initWithUDID:(NSString*)udid
{
    self = [super init];
    if ( self ) {
        self.udid = udid;
        [self initialBluetoothSetup];
    }
    return self;
}

- (void)initialBluetoothSetup
{
    self.locationManager            = [[CLLocationManager alloc] init];
    self.locationManager.delegate   = self;
    
    NSUUID *uuid        = [[NSUUID alloc] initWithUUIDString:@"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"];
    self.beaconRegion   = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:[@(0) shortValue] minor:[@(0) shortValue] identifier:@"drewBot"];
    self.beaconRegion.notifyOnEntry = YES;
    self.beaconRegion.notifyOnExit  = YES;
    self.beaconRegion.notifyEntryStateOnDisplay = YES;
    
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    NSLog(@"Beacon Manager Set Up");
}

- (BOOL)beaconWithinRange {
    return NO;
}

@end
