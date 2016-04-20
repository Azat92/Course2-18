//
//  DetailViewController.h
//  Lesson18
//
//  Created by Мария Тимофеева on 18.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Building.h"
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *number;

@property Building *build;

@end
