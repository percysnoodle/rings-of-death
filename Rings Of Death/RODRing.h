//
//  RODRing.h
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RODRing : NSObject

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber;

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) CGRect relativeFrame;

@property (nonatomic, assign) CGFloat shadowProportion;
@property (nonatomic, assign) CGFloat aboveShadowProportion;


@end

@interface RODCircleRing : RODRing

@property (nonatomic, assign, readonly) CGFloat radius;
@property (nonatomic, assign, readonly) CGFloat lineWidth;

- (instancetype)initWithRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth;

@end

@interface RODSkullRing : RODRing

@end

@interface RODStarRing : RODRing

@end

@interface RODHornsRing : RODRing

@property (nonatomic, assign, readonly) BOOL flip;
- (instancetype)initWithFlip:(BOOL)flip;

@end