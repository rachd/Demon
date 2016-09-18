//
//  RMDHostViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDHostViewController.h"
#import "RMDHostView.h"

@interface RMDHostViewController ()

@property (nonatomic, strong) RMDHostView *hostView;

@end

@implementation RMDHostViewController

- (void)viewDidLoad {
    self.hostView = [[RMDHostView alloc] init];
    self.view = self.hostView;
}

@end
