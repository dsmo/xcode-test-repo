//
//  HouseViewSectionHeader.h
//  LouShiTong
//
//  Created by dsmo on 13-9-4.
//  Copyright (c) 2013年 DSMO. All rights reserved.
//

#import <UIKit/UIKit.h>

// HouseView 里 section 的 Header view

typedef enum {
	HouseViewHeaderOnlineUser = 0,
	HouseViewHeaderMap,
	HouseViewHeaderSale,
	HouseViewHeaderIntroduction,
	HouseViewHeaderNearTraffic,
	HouseViewHeaderAlbum
} HouseViewSectionHeaderType;

@class HouseViewSectionHeader;

@protocol HouseViewSectionHeaderDelegate <NSObject>

- (void)sectionButtonTapped:(HouseViewSectionHeader *)headerView;

@end

@interface HouseViewSectionHeader : UIView

@property (nonatomic, assign) id<HouseViewSectionHeaderDelegate> delegate;

// 这个view所在的section数
@property (nonatomic, assign) NSInteger section;

- (id)initWithType:(HouseViewSectionHeaderType)type state:(BOOL)isCellHidden;

@end
