//
//  ViewController.h
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RODRing.h"

@interface RODRingsController : UIViewController

@property (nonatomic, copy, readonly) NSArray<RODRing *> *rings;
- (instancetype)initWithRings:(NSArray<RODRing *> *)rings;

@end

