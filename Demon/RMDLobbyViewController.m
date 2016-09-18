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
    
    self.demonImage = [[UIImageView alloc] init];//WithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2)];
    self.demonImage.image = [UIImage imageNamed:@"Demon"];
    
    
    self.hostButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.hostButton.frame = CGRectMake(30, self.view.frame.size.height / 2 + 80, self.view.frame.size.width - 60, 60);
    [self.hostButton setTitle:@"Host a Game" forState:UIControlStateNormal];
    self.hostButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.hostButton.layer.borderWidth = 4;
    self.hostButton.layer.cornerRadius = 12;
    
    self.joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.joinButton.frame = CGRectMake(30, self.view.frame.size.height / 2 + 180, self.view.frame.size.width - 60, 60);
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
    self.hostButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.joinButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.demonImage];
    [self.view addSubview:self.hostButton];
    [self.view addSubview:self.joinButton];
    NSDictionary *viewsDictionary = @{@"demonImage":self.demonImage, @"hostButton":self.hostButton, @"joinButton":self.joinButton};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[demonImage]-60-[hostButton]-[joinButton]"
                                                                        options:NSLayoutFormatAlignAllLeft
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
//    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[demonImage]-0-|"
//                                                                        options:0
//                                                                        metrics:nil
//                                                                          views:viewsDictionary];
    [self.view addConstraints:constraint_POS_V];
//    [self.view addConstraints:constraint_POS_H];
}

@end
