//
//  Building.m
//  Lesson18
//
//  Created by Мария Тимофеева on 18.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "Building.h"


@implementation Building

+ (instancetype)buildingWithName:(NSString *)name descriptions:(NSString *)descriptions location:(CLLocationCoordinate2D)location andAddress:(NSString *)address {
    Building *building = [[self alloc] init];
    building.name = name;
    building.descriptions = descriptions;
    building.location = location;
    building.address = address;
    return  building;
}

+(instancetype)getBuildWithName:(NSString *)name{
    NSMutableArray<Building *> *arr = [self universityBuilding];
    for (Building *build in arr){
        if([build.name isEqual:name])return build;
    }
    return nil;

}
+(NSMutableArray* )universityBuilding{
    NSMutableArray *buildings = [NSMutableArray new];
    [buildings addObject:[self buildingWithName:@"Институт экологии и природопользования"
                                   descriptions:@"89274221301"
                                       location:CLLocationCoordinate2DMake(55.790178, 49.109038)
                                     andAddress:@"г.Казань, ул.Лево-Булачная, д.34"]];
    
    
    [buildings addObject:[self buildingWithName:@"Главное здание﻿"
                                   descriptions:@"233-78-86﻿"
                                       location:CLLocationCoordinate2DMake(55.790835, 49.121838)
                                     andAddress:@"г.Казань,ул.Кремлевская,18"]];
    
    
    [buildings addObject:[self buildingWithName:@"II-ое высотное здание"
                                   descriptions:@"233-74-93"
                                       location:CLLocationCoordinate2DMake(55.792233, 49.122307)
                                     andAddress:@"г.Казань, ул.Кремлевская,35"]];
    
    
    [buildings addObject:[self buildingWithName:@"Институт геологии"
                                   descriptions:@"233-79-91﻿﻿"
                                       location:CLLocationCoordinate2DMake(55.794189, 49.113731)
                                     andAddress:@"г.Казань, ул.Кремлевская,4/5"]];
    
    
    [buildings addObject:[self buildingWithName:@"Институт химии"
                                   descriptions:@"У233-74-85﻿﻿"
                                       location:CLLocationCoordinate2DMake(55.792499, 49.119878)
                                     andAddress:@"г.Казань, ул.Кремлевская,29/1"]];
    
    
    [buildings addObject:[self buildingWithName:@"Институт Физики"
                                   descriptions:@"233-74-22"
                                       location:CLLocationCoordinate2DMake(55.791681, 49.117592)
                                     andAddress:@"г.Казань, ул.Кремлевская,16А"]];
    
    
    [buildings addObject:[self buildingWithName:@"Учебное здание ИУЭиФ"
                                   descriptions:@"89172364890"
                                       location:CLLocationCoordinate2DMake(55.790691, 49.172285)
                                     andAddress:@"г.Казань, ул.Гвардейская, 9"]];
    
    
    [buildings addObject:[self buildingWithName:@"Лабораторно-лечебное здание ИФМиБ"
                                   descriptions:@"89872605582"
                                       location:CLLocationCoordinate2DMake(55.783339, 49.136512)
                                     andAddress:@"г.Казань, ул.Волкова,18"]];
    
    
    [buildings addObject:[self buildingWithName:@"Инженерный корпус"
                                   descriptions:@"89178916083"
                                       location:CLLocationCoordinate2DMake(55.772167, 49.116861)
                                     andAddress:@"г.Казань,ул.Сайдашева,12"]];
    
    
    [buildings addObject:[self buildingWithName:@"Учебное здание №36"
                                   descriptions:@"292-29-42"
                                       location:CLLocationCoordinate2DMake(55.785225, 49.118838)
                                     andAddress:@"г.Казань, ул.Пушкина,1/55"]];
    return buildings;
}
@end
