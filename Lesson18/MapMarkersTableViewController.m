//
//  MapMarkersTableViewController.m
//  Lesson18
//
//  Created by Эдуард Рязапов on 07.06.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MapMarkersTableViewController.h"
#import "MapMarker.h"
#import "DetailMapMarkerViewController.h"

@interface MapMarkersTableViewController ()

@property NSArray<MapMarker *> *universityMarkers;
@property NSInteger selectedItem;

@end

@implementation MapMarkersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.universityMarkers = [MapMarker kpfuUniversityMapMarkers];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.universityMarkers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.universityMarkers[indexPath.row].title;
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedItem = indexPath.row;
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailMapMarkerViewController *vc = [segue destinationViewController];
    vc.mapMarker = self.universityMarkers[self.selectedItem];
}

@end
