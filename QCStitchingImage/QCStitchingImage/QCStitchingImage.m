//
//  QCStitchingImage.m
//  layer
//
//  Created by Joe on 16/8/11.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import "QCStitchingImage.h"
#import "CALayer+WebCache.h"
#import <QuartzCore/QuartzCore.h>
#import "CALayer+WebCache.h"

@interface QCStitchingImage ()

@property (nonatomic, strong) NSArray *imageUrlArray; /**< 存放图片url的数组 */
@property (nonatomic, strong) NSMutableArray *layerFrames; /**< 存放layerFrame的数组 */
@property (nonatomic, assign) CGFloat imageWidthH; /**< 图片的宽高 */
@property (nonatomic, assign) CGFloat margin; /**< 图片之间的间距 */

@end

@implementation QCStitchingImage

+ (instancetype)stitchingWithImageArray:(NSArray *)imageArray{
    return [self stitchingWithFrame:CGRectMake(0, 0, 200, 200) imageArray:imageArray];
}

+ (instancetype)stitchingWithImageArray:(NSArray *)imageArray margin:(CGFloat)margin{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, 200, 200) stitchingWithImageUrl:imageArray margin:margin];
}


+ (instancetype)stitchingWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray{
    return [[self alloc] initWithFrame:frame stitchingWithImageUrl:imageArray margin:5];
}

- (instancetype)initWithFrame:(CGRect)frame stitchingWithImageUrl:(NSArray *)imgeUrl margin:(CGFloat)margin{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layerFrames = [NSMutableArray array];
        self.imageUrlArray = imgeUrl;
        self.margin = margin;
        
        [self stitchingWithImageCount: self.imageUrlArray.count];
        
        for (int i = 0; i < imgeUrl.count; i ++) {
            CALayer *layer = [CALayer layer];
            layer.frame = [self.layerFrames[i] CGRectValue];
            
            if ([UIImage imageNamed:imgeUrl[i]]) {
                layer.contents =  (__bridge id _Nullable)([UIImage imageNamed:imgeUrl[i]].CGImage);
            }else{
                [layer sd_setImageWithURL:[NSURL URLWithString:imgeUrl[i]]];
            }
            
            [self.layer addSublayer:layer];
        }
    }
    return self;
}


- (void)stitchingWithImageCount:(NSInteger)count{
    CGFloat wh = self.bounds.size.width;
    
    [self generateImageViewSideLengthWithCanvasView:wh byImageViewsCount:count];

    
    switch (self.imageUrlArray.count) {
        case 1: {
            CGRect imgRect = CGRectMake((wh- self.imageWidthH)/2.0, (wh-self.imageWidthH)/2.0, self.imageWidthH, self.imageWidthH);
            [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect]];
        } break;
            
        case 2: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH) / 2;
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        case 3: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH * 2) / 3;
            CGRect imgRect = CGRectMake((wh - self.imageWidthH) / 2, row_1_origin_y, self.imageWidthH, self.imageWidthH);
            [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect]];
            [self generatorMatrix:count beginOriginY:row_1_origin_y + self.imageWidthH + _margin];
        } break;
            
        case 4: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH * 2) / 3;
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        case 5: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH * 2 - _margin) / 2;
            CGRect imgRect1 = CGRectMake((wh - 2 * self.imageWidthH - _margin) / 2, row_1_origin_y, self.imageWidthH, self.imageWidthH);
            [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect1]];
            
            CGRect imgRect2 = CGRectMake(imgRect1.origin.x + imgRect1.size.width + _margin, row_1_origin_y, self.imageWidthH, self.imageWidthH);
            [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect2]];
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y + self.imageWidthH + _margin];
        } break;
            
        case 6: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH * 2 - _margin) / 2;
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        case 7: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH * 3) / 4;
            CGRect imgRect = CGRectMake((wh - self.imageWidthH) / 2, row_1_origin_y, self.imageWidthH, self.imageWidthH);
            [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect]];
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y + self.imageWidthH + _margin];
        } break;
            
        case 8: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH * 3) / 4;
            CGRect imgRect1 = CGRectMake((wh - 2 * self.imageWidthH - _margin) / 2, row_1_origin_y, self.imageWidthH, self.imageWidthH);
            [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect1]];
            
            CGRect imgRect2 = CGRectMake(imgRect1.origin.x + imgRect1.size.width + _margin, row_1_origin_y, self.imageWidthH, self.imageWidthH);
            [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect2]];
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y + self.imageWidthH + _margin];
        } break;
            
        case 9: {
            CGFloat row_1_origin_y = (wh - self.imageWidthH * 3) / 4;
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        default: break;
    }
}

- (void)generatorMatrix:(NSInteger)count beginOriginY:(CGFloat)beginOriginY{
    int cellCount;
    int maxRow;
    int maxColumn;
    int ignoreCountOfBegining;
    
    if (count <= 4){
        maxRow = 2;
        maxColumn = 2;
        ignoreCountOfBegining = count % 2;
        cellCount = 4;
    } else {
        maxRow = 3;
        maxColumn = 3;
        ignoreCountOfBegining = count % 3;
        cellCount = 9;
    }
    
    for (int i = 0; i < cellCount; i++) {
        if (i > count - 1) break;
        if (i < ignoreCountOfBegining) continue;
        
        int row = floor((float)(i - ignoreCountOfBegining) / maxRow);
        int column = (i - ignoreCountOfBegining) % maxColumn;
        
        CGFloat origin_x = _margin + self.imageWidthH * column + _margin * column;
        CGFloat origin_y = beginOriginY + self.imageWidthH * row + _margin * row;
        
        CGRect imgRect = CGRectMake(origin_x, origin_y, self.imageWidthH, self.imageWidthH);
        [self.layerFrames addObject:[NSValue valueWithCGRect:imgRect]];
    }
}

- (void)generateImageViewSideLengthWithCanvasView:(CGFloat)imgViewW byImageViewsCount:(NSInteger)count{
    CGFloat sideLength = 0.0f;
    
    if (count == 1) {
        sideLength = imgViewW;
    } else if (count >=2 && count <=4) {
        sideLength = (imgViewW - _margin * 3) / 2.0;
    } else {
        sideLength = (imgViewW - _margin * 4) / 3.0;
    }
    
    self.imageWidthH = sideLength;
}

@end
