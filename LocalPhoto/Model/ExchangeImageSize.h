/**
 *  @file
 *  @author 张凡
 *  @date 2016/4/6
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  @class ExchangeImageSize
 *  @brief 图片大小改变(图片压缩)
 *  @author 张凡
 *  @date 2016/4/6
 */

@interface ExchangeImageSize : NSObject

/// @brief 图片压缩
+ (UIImage *)pictureCompression:(UIImage *)img;

@end
