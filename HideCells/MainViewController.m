//
//  MainViewController.m
//  HideCells
//
//  Created by 熊建文 on 13-12-4.
//  Copyright (c) 2013年 598295582@qq.com. All rights reserved.
//

#import "MainViewController.h"
#import "HouseViewSectionHeader.h"

@interface MainViewController () <HouseViewSectionHeaderDelegate>
{
    NSMutableArray * _rowCountArray;
    NSMutableArray * _sectionHideStateArray;
}

@end

@implementation MainViewController

- (void)dealloc
{
    [_rowCountArray release];
    [_sectionHideStateArray release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _rowCountArray = [[NSMutableArray alloc] initWithObjects:@2, @3, @4, nil];
    _sectionHideStateArray = [[NSMutableArray alloc] initWithObjects:@NO, @NO, @NO, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _rowCountArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 在这里用section隐藏状态判断返回的行数，_rowCountArray中的值在折叠cell时不修改
    if ([[_sectionHideStateArray objectAtIndex:section] boolValue]) {
        return 0;
    } else {
        return [[_rowCountArray objectAtIndex:section] integerValue];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	HouseViewSectionHeader * sectionHeader = [[HouseViewSectionHeader alloc] initWithType:section state:[[_sectionHideStateArray objectAtIndex:section] boolValue]];
	sectionHeader.section = section;
	sectionHeader.delegate = self;
	return [sectionHeader autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 40.0f;
}

#pragma mark - HouseViewSectionHeaderDelegate

- (void)sectionButtonTapped:(HouseViewSectionHeader *)headerView
{
	// TODO:点击section 按钮 收起 对应cell
	// 可能要修改的，应该把对应的section数传过来，好找到对应的cell
	BOOL isHidden = [[_sectionHideStateArray objectAtIndex:headerView.section] boolValue];
    NSMutableArray * indexPaths = [NSMutableArray array];
    NSInteger rowNumber = [[_rowCountArray objectAtIndex:headerView.section] integerValue];
    for (int i = 0; i < rowNumber; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:headerView.section]];
    }
    NSLog(@"indexpaths %@", indexPaths);
	if (!isHidden) {
		NSLog(@"隐藏cell");
		// 改变section隐藏状态
		[_sectionHideStateArray replaceObjectAtIndex:headerView.section withObject:@YES];
		[self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationMiddle];
	} else {
		NSLog(@"显示cell");
		// 改变cell隐藏状态
		[_sectionHideStateArray replaceObjectAtIndex:headerView.section withObject:@NO];
		[self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationMiddle];
		// 将显示出来的cell滚动显示出来
		[self.tableView scrollToRowAtIndexPath:[indexPaths lastObject]atScrollPosition:UITableViewScrollPositionMiddle	animated:YES];
	}
}

@end
