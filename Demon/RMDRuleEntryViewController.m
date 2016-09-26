//
//  RMDRuleEntryViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/26/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDRuleEntryViewController.h"
#import "RMDRuleEntryView.h"

@implementation RMDRuleEntryViewController

- (void)viewDidLoad {
    RMDRuleEntryView *ruleView = [[RMDRuleEntryView alloc] init];
    self.view = ruleView;
}

@end
