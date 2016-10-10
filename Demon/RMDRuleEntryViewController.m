//
//  RMDRuleEntryViewController.m
//  Demon
//
//  Created by Rachel Dorn on 9/26/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDRuleEntryViewController.h"
#import "RMDRuleEntryView.h"
#import "RMDConnectionManager.h"
#import "RMDRule.h"

@interface RMDRuleEntryViewController()

@property (nonatomic, strong) RMDRuleEntryView *ruleView;

@end

@implementation RMDRuleEntryViewController

- (instancetype)initWithNumber:(NSInteger)number {
    self = [super init];
    if (self) {
        self.ruleView = [[RMDRuleEntryView alloc] init];
        self.ruleView.number = number;
    }
    return self;
}

- (void)viewDidLoad {
    
    self.view = self.ruleView;
}

- (void)submitRule {
    [[RMDRule singletonRules] addRule:self.ruleView.ruleField.text];
    
    NSData *dataToSend = [self.ruleView.ruleField.text dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *allPeers = [RMDConnectionManager singletonManager].session.connectedPeers;
    NSError *error;
    
    [[RMDConnectionManager singletonManager].session sendData:dataToSend
                                                      toPeers:allPeers
                                                     withMode:MCSessionSendDataReliable
                                                        error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }

    NSLog(@" here %@", [[RMDRule singletonRules] allRules]);
}


@end
