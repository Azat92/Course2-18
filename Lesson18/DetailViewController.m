//
//  DetailViewController.m
//  Lesson18
//
//  Created by Мария Тимофеева on 18.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

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



@end
