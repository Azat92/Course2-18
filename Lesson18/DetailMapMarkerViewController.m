//
//  DetailMapMarkerViewController.m
//  Lesson18
//
//  Created by Эдуард Рязапов on 07.06.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "DetailMapMarkerViewController.h"

@interface DetailMapMarkerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;

@end

@implementation DetailMapMarkerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.mapMarker.title;
    self.positionLabel.text = self.mapMarker.subtitle;
}

- (IBAction)navigate:(id)sender {
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.mapMarker.coordinate addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.mapMarker.title;
    [mapItem openInMapsWithLaunchOptions:@{ MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving }];
}

@end
