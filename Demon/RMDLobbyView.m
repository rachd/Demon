//
//  RMDLobbyView.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDLobbyView.h"

@implementation RMDLobbyView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.00 blue:0.00 alpha:1.0];
    
        self.demonImage = [[UIImageView alloc] init];
        self.demonImage.image = [UIImage imageNamed:@"Demon"];
        self.demonImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.demonImage];
    
        self.hostButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.hostButton setTitle:@"Host a Game" forState:UIControlStateNormal];
        self.hostButton.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.hostButton.layer.borderWidth = 4;
        self.hostButton.layer.cornerRadius = 12;
        self.hostButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.hostButton];
    
        self.joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.joinButton setTitle:@"Join a Game" forState:UIControlStateNormal];
        self.joinButton.layer.borderColor = [[UIColor whiteColor] CGColor];
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
    
        UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.demonImage, buttonStack]];
        stackView.axis = UILayoutConstraintAxisVertical;
        stackView.distribution = UIStackViewDistributionFillEqually;
        stackView.spacing = 30.0;
        stackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:stackView];
        
        NSDictionary *viewsDictionary = @{@"stackView": stackView};
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

@end
