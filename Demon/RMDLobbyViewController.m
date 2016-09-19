//
//  RMDLobbyViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/15/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDLobbyViewController.h"
#import "RMDLobbyView.h"
#import "RMDHostViewController.h"
#import "RMDJoinViewController.h"

@interface RMDLobbyViewController () <RMDHostDelegate>

@property (nonatomic, strong)RMDLobbyView *lobbyView;

@end

@implementation RMDLobbyViewController

- (void)viewDidLoad {
    self.lobbyView = [[RMDLobbyView alloc] init];
    self.view = self.lobbyView;
    
    [self.lobbyView.hostButton addTarget:self action:@selector(hostAction) forControlEvents:UIControlEventTouchUpInside];
    [self.lobbyView.joinButton addTarget:self action:@selector(joinAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)hostAction {
    RMDHostViewController *hostVC = [[RMDHostViewController alloc] init];
    hostVC.delegate = self;
    [self presentViewController:hostVC animated:YES completion:nil];
}

- (void)joinAction {
    RMDJoinViewController *joinVC = [[RMDJoinViewController alloc] init];
    [self presentViewController:joinVC animated:YES completion:nil];
}

- (void)closeHostView {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
