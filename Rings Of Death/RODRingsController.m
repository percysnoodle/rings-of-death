//
//  ViewController.m
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import "RODRingsController.h"
#import "RODRingsView.h"

@interface RODRingsController () <RODRingsViewDelegate>

@property (nonatomic, strong, readonly) RODRingsView *ringsView;

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong, readonly) NSMutableDictionary<NSNumber *, NSNumber *> *progressByIndex;

@end

@implementation RODRingsController

- (instancetype)initWithRings:(NSArray<RODRing *> *)rings
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        _rings = rings;
        
        _currentIndex = -1;
        _progressByIndex = [NSMutableDictionary dictionary];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Go" style:UIBarButtonItemStyleDone target:self action:@selector(go)];
    }
    return self;
}

- (void)go
{
    self.currentIndex = (self.currentIndex + 1) % self.rings.count;
    
    CGFloat progress = [self.progressByIndex[@(self.currentIndex)] doubleValue];
    
    if (progress == 0)
    {
        progress = M_LOG10E; // an awkward number that's less than one half.
    }
    else if (progress > 4)
    {
        progress = 0;
    }
    else
    {
        progress *= 2;
    }
    
    self.progressByIndex[@(self.currentIndex)] = @(progress);
    [self.ringsView reloadRingAtIndex:self.currentIndex animated:YES];
}

#pragma mark - View and delegate

- (void)loadView
{
    self.view = [[RODRingsView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.ringsView.delegate = self;
    [self.ringsView reloadData];
}

- (RODRingsView *)ringsView
{
    return (RODRingsView *)self.viewIfLoaded;
}

- (NSInteger)numberOfRingsInRingsView:(RODRingsView *)ringsView
{
    return self.rings.count;
}

- (RODRing *)ringsView:(RODRingsView *)ringsView ringAtIndex:(NSInteger)index
{
    return self.rings[index];
}

- (CGFloat)ringsView:(RODRingsView *)ringsView progressForRingAtIndex:(NSInteger)index
{
    return [self.progressByIndex[@(index)] doubleValue];
}

@end
