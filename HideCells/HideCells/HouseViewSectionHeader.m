//
//  HouseViewSectionHeaderView.m
//  LouShiTong
//
//  Created by dsmo on 13-9-4.
//  Copyright (c) 2013年 DSMO. All rights reserved.
//

#import "HouseViewSectionHeader.h"

@implementation HouseViewSectionHeader
{
	BOOL _isCellHidden;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithType:(HouseViewSectionHeaderType)type state:(BOOL)isCellHidden
{
	self = [super initWithFrame:CGRectMake(0, 0, 320, 40)];
	if (self) {
		self.backgroundColor = [UIColor whiteColor];
		
		// 左侧图片
		UIImageView * imageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)] autorelease];
		// 标题
		UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 150, 20)];
		titleLabel.font = [UIFont systemFontOfSize:15];
		
		switch (type) {
			case HouseViewHeaderOnlineUser:
				imageView.image = [UIImage imageNamed:@"SRHouseViewHeaderOnlineUser"];
				titleLabel.text = @"咨询在线置业顾问";
				break;
			case HouseViewHeaderMap:
				imageView.image = [UIImage imageNamed:@"SRHouseViewHeaderMap"];
				titleLabel.text = @"楼盘位置";
				break;
			case HouseViewHeaderSale:
				imageView.image = [UIImage imageNamed:@"SRHouseViewHeaderSale"];
				titleLabel.text = @"销售动态";
				break;
			case HouseViewHeaderIntroduction:
				imageView.image = [UIImage imageNamed:@"SRHouseViewHeaderIntroduction"];
				titleLabel.text = @"项目介绍";
				break;
			case HouseViewHeaderNearTraffic:
				imageView.image = [UIImage imageNamed:@"SRHouseViewHeaderNearTraffic"];
				titleLabel.text = @"周边配套/周边交通";
				break;
			case HouseViewHeaderAlbum:
				imageView.image = [UIImage imageNamed:@"SRHouseViewHeaderAlbum"];
				titleLabel.text = @"效果图";
				break;
			default:
				break;
		}
		
		
		// 按钮
		UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(280, 0, 40, 40)];
		[button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
		if (isCellHidden) {
			[button setImage:[UIImage imageNamed:@"SRHouseViewHeaderDown"] forState:UIControlStateNormal];
		} else {
			[button setImage:[UIImage imageNamed:@"SRHouseViewHeaderUp"] forState:UIControlStateNormal];
		}
		_isCellHidden = isCellHidden;
		
		[self addSubview:imageView];
		[self addSubview:titleLabel];
		[self addSubview:button];
	}
	return self;
}

- (void)buttonAction:(UIButton *)button
{
	NSLog(@"section button 点击");
	if ([self.delegate respondsToSelector:@selector(sectionButtonTapped:)]) {
		[self.delegate sectionButtonTapped:self];
	}
	if (_isCellHidden) {
		// 如果cell是隐藏的，则把图片置为上指针
		[button setImage:[UIImage imageNamed:@"SRHouseViewHeaderUp"] forState:UIControlStateNormal];
		_isCellHidden = !_isCellHidden;
	} else {
		// 如果cell不是隐藏的，则把图片置为下指针
		[button setImage:[UIImage imageNamed:@"SRHouseViewHeaderDown"] forState:UIControlStateNormal];
		_isCellHidden = !_isCellHidden;
	}
}

@end
