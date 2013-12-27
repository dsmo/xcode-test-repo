//
//  GNGraphicsViewControllerView.m
//  Graphics
//
//  Created by ShiYu on 13-12-26.
//  Copyright (c) 2013年 Gionee. All rights reserved.
//

#import "GNGraphicsViewControllerView.h"

static const NSInteger foneSize = 2;

@implementation GNGraphicsViewControllerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIFont *helveticaBold = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0f];
    NSString *myString = @"Some String";
    [myString drawAtPoint:CGPointMake(40, 180) withFont:helveticaBold];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *textColor = [UIColor redColor];
    [textColor set];
}

@end
