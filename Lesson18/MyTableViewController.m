//
//  MyTableViewController.m
//  Lesson18
//
//  Created by Мария Тимофеева on 18.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MyTableViewController.h"
#import "Building.h"
#import "DetailViewController.h"

@interface MyTableViewController ()

@property  NSMutableArray *universityBuilding;

@end

@implementation MyTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_universityBuilding) {
        _universityBuilding = [Building universityBuilding] ;

    
    }
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_universityBuilding count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Building *building = [_universityBuilding objectAtIndex:indexPath.row];
    cell.textLabel.text = building.name;
    
    
    return cell;
}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *dvc = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Building *build =self.universityBuilding[indexPath.row];
    dvc.build = build;
    
}


@end
