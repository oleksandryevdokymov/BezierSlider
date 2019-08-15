//
//  UIBezierPath+forEachElement.h
//  MoveViewFromPath
//
//  Created by Oleksandr Yevdokymov on 8/11/19.
//  Copyright © 2019 OleksandrYevdokymov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (forEachElement)

- (void)forEachElement:(void (^)(CGPathElement const *element))block;


@end

NS_ASSUME_NONNULL_END
