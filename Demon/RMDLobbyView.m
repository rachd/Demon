//
//  RMDLobbyView.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDLobbyView.h"

@interface RMDLobbyView ()

@property (nonatomic, strong) UIStackView *mainStack;

@end

@implementation RMDLobbyView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.64 green:0.11 blue:0.11 alpha:1.0];//[UIColor colorWithRed:0.05 green:0.00 blue:0.00 alpha:1.0];
    
        self.demonImage = [[UIImageView alloc] init];
        self.demonImage.image = [UIImage imageNamed:@"DemonSVG"];
        self.demonImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.demonImage];
    
        self.hostButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.hostButton setTitle:@"Host a Game" forState:UIControlStateNormal];
        [self.hostButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.hostButton.layer.borderColor = [[UIColor blackColor] CGColor];
        self.hostButton.layer.borderWidth = 4;
        self.hostButton.layer.cornerRadius = 12;
        self.hostButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.hostButton];
    
        self.joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.joinButton setTitle:@"Join a Game" forState:UIControlStateNormal];
        self.joinButton.layer.borderColor = [[UIColor blackColor] CGColor];
        [self.joinButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.joinButton.layer.borderWidth = 4;
        self.joinButton.layer.cornerRadius = 12;
        self.joinButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.joinButton];
    
        UIStackView *buttonStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.hostButton, self.joinButton]];
        buttonStack.axis = UILayoutConstraintAxisVertical;
        buttonStack.distribution = UIStackViewDistributionFillEqually;
        buttonStack.spacing = 30.0;
        buttonStack.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:buttonStack];
    
        self.mainStack = [[UIStackView alloc] initWithArrangedSubviews:@[self.demonImage, buttonStack]];
        self.mainStack.axis = UILayoutConstraintAxisVertical;
        self.mainStack.distribution = UIStackViewDistributionFillEqually;
        self.mainStack.spacing = 30.0;
        self.mainStack.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.mainStack];
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"Demon";
        titleLabel.font = [UIFont systemFontOfSize:40];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.textColor = [UIColor blackColor];
        [self addSubview:titleLabel];
        
        UIStackView *titleStack = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, self.mainStack]];
        titleStack.translatesAutoresizingMaskIntoConstraints = NO;
        titleStack.axis = UILayoutConstraintAxisVertical;
        titleStack.alignment = UIStackViewAlignmentCenter;
        titleStack.spacing = 20.0;
        [self addSubview:titleStack];
        
        NSDictionary *viewsDictionary = @{@"stackView": titleStack};
        NSArray *vert = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[stackView]-20-|"
                                                                options:0
                                                                metrics:nil
                                                                  views:viewsDictionary];
        NSArray *horiz = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[stackView]-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:viewsDictionary];
        [self addConstraints:vert];
        [self addConstraints:horiz];
    }
    return self;
}

- (void)rotate {
    if (self.mainStack.axis == UILayoutConstraintAxisVertical) {
        self.mainStack.axis = UILayoutConstraintAxisHorizontal;
    } else {
        self.mainStack.axis = UILayoutConstraintAxisVertical;
    }
}

@end
