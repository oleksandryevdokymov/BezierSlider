//
//  PathPoints.m
//  MoveViewFromPath
//
//  Created by Oleksandr Yevdokymov on 8/11/19.
//  Copyright © 2019 OleksandrYevdokymov. All rights reserved.
//

#import "PathPoints.h"
#import "UIBezierPath+forEachElement.h"

@implementation PathPoints

static CGPoint *lastPointOfPathElement(CGPathElement const *element) {
    int index;
    switch (element->type) {
        case kCGPathElementMoveToPoint: index = 0; break;
        case kCGPathElementAddCurveToPoint: index = 2; break;
        case kCGPathElementAddLineToPoint: index = 0; break;
        case kCGPathElementAddQuadCurveToPoint: index = 1; break;
        case kCGPathElementCloseSubpath: index = -1; break;
    }
    return index == NSNotFound ? 0 : &element->points[index];
}

+ (NSMutableArray*)createPathPoints:(UIBezierPath *)path {
    CGPathRef cgDashedPath = CGPathCreateCopyByDashingPath(path.CGPath, NULL, 0, (CGFloat[]){ 1.0f, 1.0f }, 2);
    UIBezierPath *dashedPath = [UIBezierPath bezierPathWithCGPath:cgDashedPath];
    CGPathRelease(cgDashedPath);
    
    static CGFloat const kMinimumDistance = 0.1f;
    
    __block CGPoint priorPoint = { HUGE_VALF, HUGE_VALF };
    
    NSMutableData *pathPointsData_ = [[NSMutableData alloc] init];
    
    [dashedPath forEachElement:^(const CGPathElement *element) {
        CGPoint *p = lastPointOfPathElement(element);
        if (!p)
            return;
        if (hypotf(p->x - priorPoint.x, p->y - priorPoint.y) < kMinimumDistance)
            return;
        [pathPointsData_ appendBytes:p length:sizeof *p];
        priorPoint = *p;
    }];
    
    CGPoint const *pathPoints_ = (CGPoint const *)pathPointsData_.bytes;
    NSInteger pathPointsCount_ = pathPointsData_.length / sizeof *pathPoints_;

    if (pathPointsCount_ > 1 && hypotf(pathPoints_[0].x - priorPoint.x, pathPoints_[0].y - priorPoint.y) < kMinimumDistance) {
        pathPointsCount_ -= 1;
    }
    
    NSMutableArray *points = [[NSMutableArray alloc] init];
    for (int i = 0; i < pathPointsCount_; i++) {
        CGPoint point = pathPoints_[i];
        [points addObject:[NSValue valueWithCGPoint:point]];
    }
    return points;
}

@end
