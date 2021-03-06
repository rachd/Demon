//
//  RMDJoinViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDJoinViewController.h"
#import "RMDJoinView.h"
#import "RMDConnectionManager.h"
#import "RMDRuleEntryViewController.h"

@interface RMDJoinViewController ()

@property (nonatomic, strong) RMDJoinView *joinView;

@end

@implementation RMDJoinViewController

- (void)viewDidLoad {
    self.joinView = [[RMDJoinView alloc] init];
    self.view = self.joinView;
    
    [self.joinView.closeButton addTarget:self.delegate action:@selector(closeJoinView) forControlEvents:UIControlEventTouchUpInside];
    [self.joinView.connectButton addTarget:self action:@selector(connect) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startGame)
                                                 name:@"StartGameNotification"
                                               object:nil];
}

- (void)connect {
    if (![self.joinView.nameField.text isEqual: @""]) {
        [[RMDConnectionManager singletonManager] setupPeerAndSessionWithDisplayName:self.joinView.nameField.text];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [[RMDConnectionManager singletonManager] cancelSession];
}

- (void)startGame {
    RMDRuleEntryViewController *ruleVC = [[RMDRuleEntryViewController alloc] initWithNumber:1];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:ruleVC animated:YES completion:nil];
    });
}

@end
