//
//  RMDConnectionManager.m
//  Demon
//
//  Created by Rachel Dorn on 9/24/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDConnectionManager.h"

@implementation RMDConnectionManager

+ (instancetype)singletonManager {
    static RMDConnectionManager *singletonManager;
    if (!singletonManager) {
        singletonManager = [[self alloc] initPrivate];
    }
    return singletonManager;
}

-(instancetype)initPrivate {
    self = [super init];
    
    if (self) {
        _peerID = nil;
        _session = nil;
        _browser = nil;
        _advertiser = nil;
    }
    
    return self;
}

- (void)setupPeerAndSessionWithDisplayName:(NSString *)displayName {
    _peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    
    _session = [[MCSession alloc] initWithPeer:_peerID];
    _session.delegate = self;
    
    _advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"demon"
                                                       discoveryInfo:nil
                                                             session:_session];
    [_advertiser start];
}

- (void)setupMCBrowser {
    _browser = [[MCBrowserViewController alloc] initWithServiceType:@"demon" session:_session];
}

- (void)cancelSession {
    _peerID = nil;
    _session = nil;
    [_advertiser stop];
    _advertiser = nil;
}

#pragma mark MCSession Delegate Methods

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state{
    NSDictionary *dict = @{@"peerID": peerID,
                           @"state" : [NSNumber numberWithInt:state]
                           };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MCDidChangeStateNotification"
                                                        object:nil
                                                      userInfo:dict];
}


-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{
    
}


-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress{
    
}


-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error{
    
}


-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{
    
}

@end
