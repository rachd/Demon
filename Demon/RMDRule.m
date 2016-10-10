//
//  RMDRule.m
//  Demon
//
//  Created by Rachel Dorn on 10/8/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import "RMDRule.h"

@interface RMDRule ()

@property (nonatomic, strong) NSMutableArray *rulesArray;

@end

@implementation RMDRule

+ (instancetype)singletonRules {
    static RMDRule *singletonRules;
    if (!singletonRules) {
        singletonRules = [[self alloc] initPrivate];
    }
    return singletonRules;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        self.rulesArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addRule:(NSString *)rule {
    [self.rulesArray addObject:rule];
}

- (NSArray *)allRules {
    return [self.rulesArray copy];
}

@end
