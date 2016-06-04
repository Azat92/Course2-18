//
//  MapDetailViewController.m
//  Lesson18
//
//  Created by Мария Тимофеева on 20.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MapDetailViewController.h"

@interface MapDetailViewController ()

@end

@implementation MapDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.name.text = self.build.name;
    self.address.text = self.build.address;
    self.number.text = self.build.descriptions;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"tb"]animated:YES completion:nil];
}

@end
