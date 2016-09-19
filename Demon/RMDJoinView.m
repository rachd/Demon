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
    return self;
}

@end
