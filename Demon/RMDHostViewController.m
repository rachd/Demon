//
//  RMDHostViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDHostViewController.h"
#import "RMDHostView.h"
#import "RMDConnectionManager.h"

@interface RMDHostViewController ()

@property (nonatomic, strong) RMDHostView *hostView;
@property (nonatomic, strong) NSMutableArray *arrConnectedDevices;

@end

@implementation RMDHostViewController

- (void)viewDidLoad {
    self.hostView = [[RMDHostView alloc] init];
    self.view = self.hostView;
    
    [self.hostView.closeButton addTarget:self.delegate action:@selector(closeHostView) forControlEvents:UIControlEventTouchUpInside];
    
    [[RMDConnectionManager singletonManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(peerDidChangeStateWithNotification:)
                                                 name:@"MCDidChangeStateNotification"
                                               object:nil];
    
    _arrConnectedDevices = [[NSMutableArray alloc] init];

}

- (void)viewWillAppear:(BOOL)animated {
    [[RMDConnectionManager singletonManager] setupMCBrowser];
    [[[RMDConnectionManager singletonManager] browser] setDelegate:self];
    if (_arrConnectedDevices.count < 4) {
        [self presentViewController:[[RMDConnectionManager singletonManager] browser] animated:YES completion:nil];
    }
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)peerDidChangeStateWithNotification:(NSNotification *)notification{
    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    MCSessionState state = [[[notification userInfo] objectForKey:@"state"] intValue];
    if (state != MCSessionStateConnecting) {
        if (state == MCSessionStateConnected) {
            [_arrConnectedDevices addObject:peerDisplayName];
        }
        else if (state == MCSessionStateNotConnected){
            if ([_arrConnectedDevices count] > 0) {
                int indexOfPeer = [_arrConnectedDevices indexOfObject:peerDisplayName];
                [_arrConnectedDevices removeObjectAtIndex:indexOfPeer];
            }
        }
    }
}

@end
