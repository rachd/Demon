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

@end

@implementation RMDHostViewController

- (void)viewDidLoad {
    self.hostView = [[RMDHostView alloc] init];
    self.view = self.hostView;
    
    [self.hostView.closeButton addTarget:self.delegate action:@selector(closeHostView) forControlEvents:UIControlEventTouchUpInside];
    
    [[RMDConnectionManager singletonManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];

}

- (void)viewWillAppear:(BOOL)animated {
    [[RMDConnectionManager singletonManager] setupMCBrowser];
    [[[RMDConnectionManager singletonManager] browser] setDelegate:self];
    [self presentViewController:[[RMDConnectionManager singletonManager] browser] animated:YES completion:nil];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
