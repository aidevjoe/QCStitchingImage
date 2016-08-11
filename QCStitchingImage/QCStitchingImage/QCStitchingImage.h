//
//  QCStitchingImage.h
//  layer
//
//  Created by Joe on 16/8/11.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCStitchingImage : UIView

/**
 *  传入一个图片数组, 返回一个九宫格图片视图
 *
 *  @param 图片数组(可以是网络图片/本地图片)
 *
 *  @return 拼好图片的视图
 */
+ (instancetype)stitchingWithImageArray:(NSArray *)imageArray;

/**
 *  传入一个图片数组, 返回一个九宫格图片视图
 *
 *  @param 图片数组(可以是网络图片/本地图片)
 *  @param 图片之间的间距
 *
 *  @return 拼好图片的视图
 */
+ (instancetype)stitchingWithImageArray:(NSArray *)imageArray margin:(CGFloat)margin;

/**
 *  传入一个图片数组, 返回一个九宫格图片视图
 *
 *  @param 视图尺寸
 *  @param 图片数组(可以是网络图片/本地图片)
 *
 *  @return 拼好图片的视图
 */
+ (instancetype)stitchingWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;

/**
 *  传入一个图片数组, 返回一个九宫格图片视图
 *
 *  @param 图片数组(可以是网络图片/本地图片)
 *  @param 图片之间的间距
 *
 *  @return 拼好图片的视图
 */

@end
