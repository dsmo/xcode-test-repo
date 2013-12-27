//
//  GNAppDelegate.h
//  FailedBankCD
//
//  Created by iMac on 13-12-23.
//  Copyright (c) 2013年 Gionee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
