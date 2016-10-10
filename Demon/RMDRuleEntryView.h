//
//  RMDRuleEntryView.h
//  Demon
//
//  Created by Rachel Dorn on 9/26/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMDRuleEntryViewController.h"

@interface RMDRuleEntryView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *ruleField;
@property (nonatomic, weak) RMDRuleEntryViewController *ruleVC;
@property (nonatomic) NSInteger number;

@end
