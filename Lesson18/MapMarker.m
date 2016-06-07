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

+ (NSArray<MapMarker *> *)kpfuUniversityMapMarkers {
    NSMutableArray<MapMarker *> *mapMarkers = [NSMutableArray new];
    MapMarker *mapMarker = [MapMarker markerWithTitle:@"Казанский федеральный университет" subtitle:@"Казань, ул. Кремлёвская, 18" andCoordinate:CLLocationCoordinate2DMake(55.790848, 49.121775)];
    [mapMarkers addObject:mapMarker];
    
    mapMarker = [MapMarker markerWithTitle:@"КФУ, Институт физики" subtitle:@"Казань, ул. Кремлевская, 16а" andCoordinate:CLLocationCoordinate2DMake(55.791592, 49.118272)];
    [mapMarkers addObject:mapMarker];
    
    mapMarker = [MapMarker markerWithTitle:@"КФУ, Институт экологии и природопользования" subtitle:@"Казань, ул. Товарищеская, 5" andCoordinate:CLLocationCoordinate2DMake(55.789588, 49.158507)];
    [mapMarkers addObject:mapMarker];
    
    mapMarker = [MapMarker markerWithTitle:@"КФУ, Институт психологии и образования" subtitle:@"Казань, ул. Мартына Межлаука, 1" andCoordinate:CLLocationCoordinate2DMake(55.787938, 49.110968)];
    [mapMarkers addObject:mapMarker];
    
    mapMarker = [MapMarker markerWithTitle:@"КФУ, Высшая школа информационных технологий и информационных систем" subtitle:@"Казань, ул. Кремлёвская, 35" andCoordinate:CLLocationCoordinate2DMake(55.792134, 49.122126)];
    [mapMarkers addObject:mapMarker];
    
    mapMarker = [MapMarker markerWithTitle:@"КФУ, Институт управления, экономики и финансов" subtitle:@"Казань, ул. Бутлерова, 4" andCoordinate:CLLocationCoordinate2DMake(55.786551, 49.126222)];
    [mapMarkers addObject:mapMarker];
    
    mapMarker = [MapMarker markerWithTitle:@"КФУ, Институт геологии и нефтегазовых технологий" subtitle:@"Казань, ул. Кремлёвская, 4/5" andCoordinate:CLLocationCoordinate2DMake(55.79428, 49.113538)];
    [mapMarkers addObject:mapMarker];
    
    mapMarker = [MapMarker markerWithTitle:@"КФУ, Институт филологии и межкультурной коммуникации им.Льва Толстого" subtitle:@"Казань, ул. Татарстан, 2, уч.зд.№33" andCoordinate:CLLocationCoordinate2DMake(55.777089, 49.110465)];
    [mapMarkers addObject:mapMarker];
    
    return mapMarkers.copy;
}

@end
