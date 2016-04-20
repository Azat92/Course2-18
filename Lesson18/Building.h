//
//  Building.h
//  Lesson18
//
//  Created by Мария Тимофеева on 18.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;


@interface Building : NSObject
@property (strong, nonatomic) NSString *name;
@property NSString *descriptions;
@property NSString *address;
@property CLLocationCoordinate2D location;
+(NSMutableArray* )universityBuilding;
+ (instancetype)buildingWithName:(NSString *)name descriptions:(NSString *)descriptions location:(CLLocationCoordinate2D)location andAddress:(NSString *)address;
+(instancetype)getBuildWithName:(NSString *)name;

@end
