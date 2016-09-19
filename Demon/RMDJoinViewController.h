//
//  RMDJoinViewController.h
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMDJoinDelegate <NSObject>

@required

- (void)closeJoinView;

@end


@interface RMDJoinViewController : UIViewController

@property (nonatomic, weak) id <RMDJoinDelegate> delegate;

@end
