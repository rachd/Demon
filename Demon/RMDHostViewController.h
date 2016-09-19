//
//  RMDHostViewController.h
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMDHostDelegate <NSObject>

@required

- (void)closeHostView;

@end


@interface RMDHostViewController : UIViewController

@property (nonatomic, weak) id <RMDHostDelegate> delegate;

@end
