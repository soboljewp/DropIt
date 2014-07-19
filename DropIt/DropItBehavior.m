//
//  DropItBehavior.m
//  DropIt
//
//  Created by Patrick Dawson on 19.07.14.
//  Copyright (c) 2014 Patrick Dawson. All rights reserved.
//

#import "DropItBehavior.h"

@interface DropItBehavior()
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@end


@implementation DropItBehavior

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
        [self addChildBehavior:_gravity];
    }
    
    return _gravity;
}

- (UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        [self addChildBehavior:_collider];
    }
    
    return _collider;
}

- (void)addItem:(id<UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
}

@end
