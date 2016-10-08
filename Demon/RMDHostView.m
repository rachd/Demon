//
//  RMDHostView.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDHostView.h"

@implementation RMDHostView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.00 blue:0.00 alpha:1.0];
        
        [self setUpCloseButton];
        [self setUpTextField];

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
    self.nameField.delegate = self.hostVC;
    [self addSubview:self.nameField];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"Name of Game: ";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:nameLabel];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [searchButton setTitle:@"Search for Devices" forState:UIControlStateNormal];
    searchButton.translatesAutoresizingMaskIntoConstraints = NO;
    [searchButton addTarget:self.hostVC action:@selector(showSelectionBrowser) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:searchButton];
    
    self.connectionsTableView = [[UITableView alloc] init];
    self.connectionsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.connectionsTableView];
    
    UIButton *disconnectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    disconnectButton.translatesAutoresizingMaskIntoConstraints = NO;
    [disconnectButton setTitle:@"Disconnect" forState:UIControlStateNormal];
    [self addSubview:disconnectButton];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[nameLabel, self.nameField, searchButton, self.connectionsTableView, disconnectButton]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.distribution = UIStackViewDistributionFill;
    [self addSubview:stackView];
    
    NSDictionary *viewDictionary = @{@"stackView":stackView};
    NSArray *constraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[stackView]-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewDictionary];
    NSArray *constraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[stackView]-20-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewDictionary];
    [self addConstraints:constraints_V];
    [self addConstraints:constraints_H];
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
