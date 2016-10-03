//
//  RMDJoinView.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDJoinView.h"

@interface RMDJoinView()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation RMDJoinView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.00 blue:0.00 alpha:1.0];
        
        [self setUpTextField];
        [self setUpCloseButton];
        [self setUpConnectButton];
        [self setConstraints];
    }
    return self;
}

- (void)setUpTextField {
    self.nameField = [[UITextField alloc] init];
    self.nameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameField.placeholder = @"Placeholder";
    self.nameField.textColor = [UIColor blackColor];
    self.nameField.backgroundColor = [UIColor whiteColor];
    self.nameField.layer.cornerRadius = 6;
    [self addSubview:self.nameField];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"Your Name: ";
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.nameLabel];
}

- (void)setUpCloseButton {
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeButton setTitle:@"X" forState:UIControlStateNormal];
    self.closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:self.closeButton];
}

- (void)setUpConnectButton {
    self.connectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.connectButton setTitle:@"Connect" forState:UIControlStateNormal];
    self.connectButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.connectButton];
}

- (void)setConstraints {
    NSDictionary *viewsDictionary = @{@"connectButton":self.connectButton, @"nameField":self.nameField, @"nameLabel":self.nameLabel, @"closeButton":self.closeButton};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[closeButton(80)]-20-[nameLabel(40)]-[nameField(50)]-40-[connectButton(40)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[closeButton(80)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraints_H_label = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[nameLabel]-30-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    NSArray *constraints_H_field = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[nameField]-30-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    NSArray *constraints_H_button = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[connectButton]-30-|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewsDictionary];
    
    [self addConstraints:constraint_POS_V];
    [self addConstraints:constraint_POS_H];
    [self addConstraints:constraints_H_label];
    [self addConstraints:constraints_H_field];
    [self addConstraints:constraints_H_button];
}

@end
