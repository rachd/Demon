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

@interface RMDHostViewController ()

@property (nonatomic, strong) RMDHostView *hostView;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation RMDHostViewController

- (void)viewDidLoad {
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[_appDelegate connectionManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [[_appDelegate connectionManager] advertiseSelf:YES];
    
    self.hostView = [[RMDHostView alloc] init];
    self.hostView.hostVC = self;
    self.view = self.hostView;
    
    [self.hostView.closeButton addTarget:self.delegate action:@selector(closeHostView) forControlEvents:UIControlEventTouchUpInside];

}

- (void)browseForDevices:(id)sender {
    [[_appDelegate connectionManager] setupMCBrowser];
    [[[_appDelegate connectionManager] browser] setDelegate:self];
    [self presentViewController:[[_appDelegate connectionManager] browser] animated:YES completion:nil];
}

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [_appDelegate.connectionManager.browser dismissViewControllerAnimated:YES completion:nil];
}


-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    [_appDelegate.connectionManager.browser dismissViewControllerAnimated:YES completion:nil];
}

@end
