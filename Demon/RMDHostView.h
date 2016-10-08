//
//  RMDHostView.h
//  Demon
//
//  Created by Rachel Dorn on 9/18/16.
//  Copyright © 2016 RachelDorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMDHostViewController.h"

@interface RMDHostView : UIView

@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, weak) RMDHostViewController *hostVC;
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITableView *connectionsTableView;

@end
