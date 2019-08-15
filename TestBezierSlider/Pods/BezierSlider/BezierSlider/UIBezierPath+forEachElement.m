//
//  UIBezierPath+forEachElement.m
//  MoveViewFromPath
//
//  Created by Oleksandr Yevdokymov on 8/11/19.
//  Copyright © 2019 OleksandrYevdokymov. All rights reserved.
//

#import "UIBezierPath+forEachElement.h"

typedef void (^UIBezierPath_forEachElement_Block)(CGPathElement const *element);

@implementation UIBezierPath (forEachElement)

static void applyBlockToPathElement(void *info, CGPathElement const *element) {
    __unsafe_unretained UIBezierPath_forEachElement_Block block =(__bridge  UIBezierPath_forEachElement_Block)info;
    block(element);
}

- (void)forEachElement:(void (^)(const CGPathElement *))block {
    CGPathApply(self.CGPath, (__bridge void *)block, applyBlockToPathElement);
}

@end
