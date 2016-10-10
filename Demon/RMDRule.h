//
//  RMDRule.h
//  Demon
//
//  Created by Rachel Dorn on 10/8/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMDRule : NSObject

+ (instancetype)singletonRules;

- (void)addRule:(NSString *)rule;
- (NSArray *)allRules;

@end
