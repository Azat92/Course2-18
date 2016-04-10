//
//  MapMarker.m
//  Lesson18
//
//  Created by Azat Almeev on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MapMarker.h"

@implementation MapMarker

+ (instancetype)markerWithTitle:(NSString *)title subtitle:(NSString *)subtitle andCoordinate:(CLLocationCoordinate2D)coordinate {
    MapMarker *marker = [[self alloc] init];
    marker.title = title;
    marker.subtitle = subtitle;
    marker.coordinate = coordinate;
    return marker;
}

+ (instancetype)universityMapMarker {
    return [MapMarker markerWithTitle:@"Kazan Federal University" subtitle:@"18, Kremlyovskaya st." andCoordinate:CLLocationCoordinate2DMake(55.7904552, 49.1218355)];
}

@end
