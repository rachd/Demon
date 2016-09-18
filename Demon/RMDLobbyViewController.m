//
//  RMDLobbyViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/15/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDLobbyViewController.h"

@interface RMDLobbyViewController ()

@property (nonatomic, strong) UIImageView *demonImage;
@property (nonatomic, strong) UIButton *hostButton;
@property (nonatomic, strong) UIButton *joinButton;

@end

@implementation RMDLobbyViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor colorWithRed:0.05 green:0.00 blue:0.00 alpha:1.0];
    
    self.demonImage = [[UIImageView alloc] init];
    self.demonImage.image = [UIImage imageNamed:@"Demon"];
    
    
    self.hostButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.hostButton setTitle:@"Host a Game" forState:UIControlStateNormal];
    self.hostButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.hostButton.layer.borderWidth = 4;
    self.hostButton.layer.cornerRadius = 12;
    
    self.joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.joinButton setTitle:@"Join a Game" forState:UIControlStateNormal];
    self.joinButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.joinButton.layer.borderWidth = 4;
    self.joinButton.layer.cornerRadius = 12;
    
    UIStackView *buttonStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.hostButton, self.joinButton]];
    buttonStack.axis = UILayoutConstraintAxisVertical;
    buttonStack.distribution = UIStackViewDistributionFillEqually;
    buttonStack.spacing = 30.0;
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.demonImage, buttonStack]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 30.0;
    [self.view addSubview:stackView];
    
    self.demonImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.demonImage];

    [self.view addSubview:buttonStack];
    NSDictionary *viewsDictionary = @{@"demonImage":self.demonImage, @"hostButton":self.hostButton, @"joinButton":self.joinButton, @"buttonStack":buttonStack};
    NSArray *constraint_POS_V_demon = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[demonImage(300)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraint_POS_V_buttons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonStack(200)]-30-|"
                                                                              options:0
                                                                                metrics:nil
                                                                                views:viewsDictionary];
    
    NSArray *constraint_POS_H_demon = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[demonImage(300)]"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:viewsDictionary];
    
    NSArray *constraint_POS_H_buttons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonStack]-0-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    [self.view addConstraints:constraint_POS_V_demon];
    [self.view addConstraints:constraint_POS_V_buttons];
    [self.view addConstraints:constraint_POS_H_buttons];
    [self.view addConstraints:constraint_POS_H_demon];
}

@end
