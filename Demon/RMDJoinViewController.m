//
//  RMDJoinViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDJoinViewController.h"
#import "RMDJoinView.h"

@interface RMDJoinViewController ()

@property (nonatomic, strong) RMDJoinView *joinView;

@end

@implementation RMDJoinViewController

MatchmakingClient *_matchmakingClient;

- (void)viewDidLoad {
    self.joinView = [[RMDJoinView alloc] init];
    self.view = self.joinView;
    
    [self.joinView.closeButton addTarget:self.delegate action:@selector(closeJoinView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (_matchmakingClient == nil)
    {
        _matchmakingClient = [[MatchmakingClient alloc] init];
        [_matchmakingClient startSearchingForServersWithSessionID:@"DEMON"];
        
        self.joinView.nameField.placeholder = _matchmakingClient.session.displayName;
        //[self.tableView reloadData];
    }
}

@end
