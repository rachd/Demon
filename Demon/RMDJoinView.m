//
//  RMDJoinView.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDJoinView.h"

@implementation RMDJoinView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.00 blue:0.00 alpha:1.0];
        
        [self setUpTextField];
        [self setUpCloseButton];
    }
    return self;
}

- (void)setUpTextField {
    UITextField *nameField = [[UITextField alloc] init];
    nameField.translatesAutoresizingMaskIntoConstraints = NO;
    nameField.placeholder = @"Placeholder";
    nameField.textColor = [UIColor blackColor];
    nameField.backgroundColor = [UIColor whiteColor];
    nameField.layer.cornerRadius = 6;
    [self addSubview:nameField];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"Your Name: ";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:nameLabel];
    
    NSDictionary *viewDictionary = @{@"nameField":nameField, @"nameLabel":nameLabel};
    NSArray *constraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[nameLabel(40)]-[nameField(50)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:viewDictionary];
    NSArray *constraints_H_label = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[nameLabel]-30-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewDictionary];
    NSArray *constraints_H_field = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[nameField]-30-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewDictionary];
    [self addConstraints:constraints_V];
    [self addConstraints:constraints_H_label];
    [self addConstraints:constraints_H_field];
}

- (void)setUpCloseButton {
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeButton setTitle:@"X" forState:UIControlStateNormal];
    self.closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:self.closeButton];
    
    NSDictionary *viewsDictionary = @{@"closeButton":self.closeButton};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[closeButton(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[closeButton(100)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self addConstraints:constraint_POS_V];
    [self addConstraints:constraint_POS_H];

}

@end
