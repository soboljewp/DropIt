//
//  DropItViewController.m
//  DropIt
//
//  Created by Patrick Dawson on 19.07.14.
//  Copyright (c) 2014 Patrick Dawson. All rights reserved.
//

#import "DropItViewController.h"
#import "DropItBehavior.h"

@interface DropItViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) DropItBehavior *dropitBehavior;
@end

@implementation DropItViewController

static const CGSize DROP_SIZE = { 40, 40 };

- (UIDynamicAnimator *)animator
{
    if (!_animator) _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
    return _animator;
}

- (DropItBehavior *)dropitBehavior
{
    if (!_dropitBehavior) {
        _dropitBehavior = [[DropItBehavior alloc] init];
        [self.animator addBehavior:_dropitBehavior];
    }
    return _dropitBehavior;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self drop];
}

- (void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random() % (int)self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    
    [self.dropitBehavior addItem:dropView];
}

- (UIColor *)randomColor
{
    switch (arc4random() % 5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

#pragma mark - Default methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
