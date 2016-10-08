//
//  RMDRuleEntryViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/26/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDRuleEntryViewController.h"
#import "RMDRuleEntryView.h"

@interface RMDRuleEntryViewController()

@property (nonatomic, strong) RMDRuleEntryView *ruleView;

@end

@implementation RMDRuleEntryViewController

- (void)viewDidLoad {
    self.ruleView = [[RMDRuleEntryView alloc] init];
    self.view = self.ruleView;
}


@end
