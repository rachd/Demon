//
//  MatchmakingClient.h
//  Demon
//
//  Created by Rachel Dorn on 9/29/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface MatchmakingClient : NSObject <GKSessionDelegate>

@property (nonatomic, strong, readonly) NSArray *availableServers;
@property (nonatomic, strong, readonly) GKSession *session;

- (void)startSearchingForServersWithSessionID:(NSString *)sessionID;

@end
