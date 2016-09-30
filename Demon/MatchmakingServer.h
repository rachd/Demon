//
//  MatchmakingServer.h
//  Demon
//
//  Created by Rachel Dorn on 9/29/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface MatchmakingServer : NSObject <GKSessionDelegate>

@property (nonatomic, assign) int maxClients;
@property (nonatomic, strong, readonly) NSArray *connectedClients;
@property (nonatomic, strong, readonly) GKSession *session;

- (void)startAcceptingConnectionsForSessionID:(NSString *)sessionID;

@end
