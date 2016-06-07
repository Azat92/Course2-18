//
//  ViewController.m
//  Lesson18
//
//  Created by Azat Almeev on 09.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MapViewController.h"
#import "MapMarker.h"
#import "DetailMapMarkerViewController.h"

@interface MapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, readonly) CLLocationManager *locationManager;
@property (nonatomic, readonly) CLGeocoder *geocoder;

@property NSArray *universityMarkers;
@end

@implementation MapViewController
@synthesize locationManager = _locationManager;
@synthesize geocoder = _geocoder;

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [CLLocationManager new];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 1;
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (CLGeocoder *)geocoder {
    if (!_geocoder)
        _geocoder = [CLGeocoder new];
    return _geocoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    self.mapView.showsScale = YES;
    self.mapView.showsUserLocation = YES;
    self.universityMarkers = [MapMarker kpfuUniversityMapMarkers];
    for (MapMarker *mapMarker in self.universityMarkers) {
        [self.mapView addAnnotation:mapMarker];
    }
}

- (IBAction)longPressDidFire:(UIGestureRecognizer *)sender {
    if (sender.state != UIGestureRecognizerStateBegan)
        return;
    
    if (self.mapView.userLocation) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Please wait" message:@"Reverse geocoding your location in progress" preferredStyle:UIAlertControllerStyleAlert];
        [self.geocoder reverseGeocodeLocation:self.mapView.userLocation.location completionHandler:^(NSArray<CLPlacemark *> *placemarks, NSError *error) {
            if (error != nil) {
                alert.title = @"Error";
                alert.message = error.localizedDescription;
            }
            else {
                alert.title = @"You current location";
//                alert.message = [NSString stringWithFormat:@"%@", placemarks.firstObject];
                CLPlacemark *placemark = placemarks.firstObject;
                alert.message = [NSString stringWithFormat:@"%@, %@, %@, %@ %@, %@", placemark.country, placemark.postalCode, placemark.locality, placemark.thoroughfare, placemark.subThoroughfare, placemark.name];
            }
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        }];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Cannot retrieve your current location" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)zoomInDidClick:(id)sender {
    [self zoomByFactor:.5];
}

- (IBAction)zoomOutDidClick:(id)sender {
    [self zoomByFactor:2];
}

- (IBAction)whereImDidClick:(id)sender {
//    [self.mapView showAnnotations:self.mapView.annotations animated:YES];
//    [self.mapView showAnnotations:@[self.universityMarker] animated:YES];
    if (self.mapView.userLocation)
        [self.mapView showAnnotations:@[ self.mapView.userLocation ] animated:YES];
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Cannot retrieve your current location" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)zoomByFactor:(CGFloat)factor {
    MKCoordinateRegion region = self.mapView.region;
    MKCoordinateSpan span = self.mapView.region.span;
    span.latitudeDelta *= factor;
    span.longitudeDelta *= factor;
    region.span = span;
    [self.mapView setRegion:region animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *pinID = @"MapPinIdentifier";
    MKPinAnnotationView *pin;
    for (MapMarker *mapMarker in self.universityMarkers) {
        if (annotation == mapMarker) {
            pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinID];
            if (!pin) {
                pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinID];
                pin.pinTintColor = MKPinAnnotationView.greenPinColor;
                pin.canShowCallout = YES;
                UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
                pin.rightCalloutAccessoryView = button;
            }
        }
    }
    return pin;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    for (MapMarker *mapMarker in self.universityMarkers) {
        if (view.annotation == mapMarker) {
            UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            DetailMapMarkerViewController *vc = [mystoryboard instantiateViewControllerWithIdentifier:@"detail"];
            vc.mapMarker = mapMarker;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%@", locations);
    
}

@end
