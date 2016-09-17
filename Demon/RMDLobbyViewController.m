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
    stackView.frame = self.view.frame;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 30.0;
    [self.view addSubview:stackView];
    
}

@end
