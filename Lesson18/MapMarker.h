//
//  MapMarker.h
//  Lesson18
//
//  Created by Azat Almeev on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface MapMarker : NSObject <MKAnnotation>
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

+ (instancetype)markerWithTitle:(NSString *)title subtitle:(NSString *)subtitle andCoordinate:(CLLocationCoordinate2D)coordinate;
+ (instancetype)universityMapMarker;

@end
