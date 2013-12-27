//
//  GNAppDelegate.h
//  Graphics
//
//  Created by ShiYu on 13-12-26.
//  Copyright (c) 2013年 Gionee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNGraphicsViewControllerView.h"

@interface GNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IBOutlet GNGraphicsViewControllerView *graphicsView;

@end
