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
    
    UILabel *ruleLabel = [[UILabel alloc] init];
    ruleLabel.text = @"Rule #1";
    ruleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    ruleLabel.textColor = [UIColor whiteColor];
    ruleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:ruleLabel];
    
    self.ruleField = [[UITextField alloc] init];
    self.ruleField.delegate = self;
    self.ruleField.translatesAutoresizingMaskIntoConstraints = NO;
    self.ruleField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.ruleField];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [submitButton addTarget:self.ruleVC action:@selector(submitRule) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:submitButton];
    
    NSDictionary *viewsDictionary = @{@"ruleField": self.ruleField, @"ruleLabel": ruleLabel, @"ruleButton": submitButton};
    NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[ruleLabel(==40)]-40-[ruleField]-20-[ruleButton]-20-|"
                                                            options:0
                                                            metrics:nil
                                                              views:viewsDictionary];
    NSArray *horiz1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[ruleField]-|"
                                                             options:0
                                                             metrics:nil
                                                               views:viewsDictionary];
    NSArray *horiz2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[ruleLabel]-|"
                                                              options:0
                                                              metrics:nil
                                                                views:viewsDictionary];
    NSArray *horiz3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[ruleButton]-|"
                                                              options:0
                                                              metrics:nil
                                                                views:viewsDictionary];
    [self addConstraints:vert];
    [self addConstraints:horiz1];
    [self addConstraints:horiz2];
    [self addConstraints:horiz3];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.ruleField endEditing:YES];
}

@end
