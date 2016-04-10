//
//  ViewController.m
//  Lesson18
//
//  Created by Azat Almeev on 09.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MapViewController.h"
#import "MapMarker.h"

@interface MapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, readonly) MapMarker *universityMarker;
@property (nonatomic, readonly) CLLocationManager *locationManager;
@property (nonatomic, readonly) CLGeocoder *geocoder;
@end

@implementation MapViewController
@synthesize universityMarker = _universityMarker;
@synthesize locationManager = _locationManager;
@synthesize geocoder = _geocoder;

- (MapMarker *)universityMarker {
    if (!_universityMarker)
        _universityMarker = [MapMarker universityMapMarker];
    return _universityMarker;
}

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
    [self.mapView addAnnotation:self.universityMarker];
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
    if (annotation == self.universityMarker) {
        static NSString *pinID = @"MapPinIdentifier";
        MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinID];
        if (!pin) {
            pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinID];
            pin.pinTintColor = MKPinAnnotationView.greenPinColor;
            pin.canShowCallout = YES;
            pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        return pin;
    }
    else
        return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    if (view.annotation == self.universityMarker) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:self.universityMarker.title message:self.universityMarker.subtitle preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Navigate" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:view.annotation.coordinate addressDictionary:nil];
            MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
            mapItem.name = view.annotation.title;
            [mapItem openInMapsWithLaunchOptions:@{ MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving }];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%@", locations);
}

@end
