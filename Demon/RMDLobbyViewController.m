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

@end

@implementation RMDLobbyViewController

- (void)viewDidLoad {
    RMDLobbyView *lobbyView = [[RMDLobbyView alloc] init];
    self.view = lobbyView;
}

@end
