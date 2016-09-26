//
//  RMDRuleEntryView.m
//  Demon
//
//  Created by Rachel Dorn on 9/26/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDRuleEntryView.h"

@implementation RMDRuleEntryView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.00 blue:0.00 alpha:1.0];
        [self setUpTextField];
    }
    return self;
}

- (void)setUpTextField {
    
    self.ruleField = [[UITextField alloc] init];
    self.ruleField.delegate = self.ruleVC;
    self.ruleField.translatesAutoresizingMaskIntoConstraints = NO;
    self.ruleField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.ruleField];
    
    NSDictionary *viewsDictionary = @{@"ruleField": self.ruleField};
    NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[ruleField]-20-|"
                                                            options:0
                                                            metrics:nil
                                                              views:viewsDictionary];
    NSArray *horiz = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[ruleField]-|"
                                                             options:0
                                                             metrics:nil
                                                               views:viewsDictionary];
    [self addConstraints:vert];
    [self addConstraints:horiz];
}

@end
