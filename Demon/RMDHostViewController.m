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
#import "RMDRuleEntryViewController.h"

@interface RMDHostViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) RMDHostView *hostView;
@property (nonatomic, strong) NSMutableArray *arrConnectedDevices;

@end

@implementation RMDHostViewController

- (void)viewDidLoad {
    self.hostView = [[RMDHostView alloc] init];
    self.view = self.hostView;
    
    self.hostView.connectionsTableView.delegate = self;
    self.hostView.connectionsTableView.dataSource = self;
    
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
}

- (void)showSelectionBrowser {
    [self presentViewController:[[RMDConnectionManager singletonManager] browser] animated:YES completion:nil];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.hostView.connectionsTableView reloadData];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.hostView.connectionsTableView reloadData];
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

- (void)startTheGame {
    NSData *dataToSend = [@"start" dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *allPeers = [RMDConnectionManager singletonManager].session.connectedPeers;
    NSError *error;
    
    [[RMDConnectionManager singletonManager].session sendData:dataToSend
                                                      toPeers:allPeers
                                                     withMode:MCSessionSendDataReliable
                                                       error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
   
    RMDRuleEntryViewController *ruleVC = [[RMDRuleEntryViewController alloc] initWithNumber:1];
    [self presentViewController:ruleVC animated:YES completion:nil];
}

#pragma mark Table View methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrConnectedDevices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *deviceCell = [tableView dequeueReusableCellWithIdentifier:@"deviceCell"];
    if (!deviceCell) {
        deviceCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"deviceCell"];
        deviceCell.textLabel.text = self.arrConnectedDevices[indexPath.row];
        deviceCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return deviceCell;
}

@end
