//
//  DropItBehavior.h
//  DropIt
//
//  Created by Patrick Dawson on 19.07.14.
//  Copyright (c) 2014 Patrick Dawson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropItBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
