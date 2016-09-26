//
//  RMDRuleEntryView.h
//  Demon
//
//  Created by Rachel Dorn on 9/26/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMDRuleEntryViewController.h"

@interface RMDRuleEntryView : UIView

@property (nonatomic, strong) UITextField *ruleField;
@property (nonatomic, weak) RMDRuleEntryViewController *ruleVC;

@end