//
//  RMDHostViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDHostViewController.h"
#import "RMDHostView.h"
#import "AppDelegate.h"
#import "MatchmakingServer.h"

@interface RMDHostViewController ()

@property (nonatomic, strong) RMDHostView *hostView;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation RMDHostViewController

MatchmakingServer *_matchmakingServer;

- (void)viewDidLoad {
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //[[_appDelegate connectionManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    //[[_appDelegate connectionManager] advertiseSelf:YES];
    
    self.hostView = [[RMDHostView alloc] init];
    self.hostView.hostVC = self;
    self.view = self.hostView;
    
    [self.hostView.closeButton addTarget:self.delegate action:@selector(closeHostView) forControlEvents:UIControlEventTouchUpInside];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (_matchmakingServer == nil)
    {
        _matchmakingServer = [[MatchmakingServer alloc] init];
        _matchmakingServer.maxClients = 3;
        [_matchmakingServer startAcceptingConnectionsForSessionID:@"DEMON"];
        
        self.hostView.nameField.placeholder = _matchmakingServer.session.displayName;
       // [self.tableView reloadData];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.hostView.nameField resignFirstResponder];
    
   // _appDelegate.connectionManager.peerID = nil;
   // _appDelegate.connectionManager.session = nil;
  //  _appDelegate.connectionManager.browser = nil;
  //
  //  [_appDelegate.connectionManager.advertiser stop];
  //  _appDelegate.connectionManager.advertiser = nil;
    
    
   // [_appDelegate.connectionManager setupPeerAndSessionWithDisplayName:self.hostView.nameField.text];
   // [_appDelegate.connectionManager setupMCBrowser];
   // [_appDelegate.connectionManager advertiseSelf:YES];
    
    return YES;
}

//- (void)browseForDevices:(id)sender {
   // [[_appDelegate connectionManager] setupMCBrowser];
   // [[[_appDelegate connectionManager] browser] setDelegate:self];
   // [self presentViewController:[[_appDelegate connectionManager] browser] animated:YES completion:nil];
//}

//-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
 //   [_appDelegate.connectionManager.browser dismissViewControllerAnimated:YES completion:nil];
//}


//-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
//    [_appDelegate.connectionManager.browser dismissViewControllerAnimated:YES completion:nil];
//}

@end
