//
//  RMDLobbyViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/15/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDLobbyViewController.h"
#import "RMDLobbyView.h"

@interface RMDLobbyViewController ()

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
    NSLog(@"host button clicked");
}

- (void)joinAction {
    NSLog(@"join button clicked");
}

@end
