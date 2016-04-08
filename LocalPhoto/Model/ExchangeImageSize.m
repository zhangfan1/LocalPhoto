#import "ExchangeImageSize.h"

@implementation ExchangeImageSize

#pragma mark - 图片压缩
+ (UIImage *)pictureCompression:(UIImage *)img
{
    /// @brief 图片的宽
    CGFloat photoWidth = img.size.width;
    /// @brief 图片的高
    CGFloat photoHeight = img.size.height;
    /// @brief 图片宽高比例
    CGFloat photoWidthAndHeigtScale = photoWidth/photoHeight;
    /// @brief 压缩后的图片的高
    CGFloat comressionHeight = 350.0;
    /// @brief 压缩后的图片的宽
    CGFloat comressionWidth = photoWidthAndHeigtScale * comressionHeight;
    /// @brief 压缩后的图片大小
    CGSize comressionSize = CGSizeMake(comressionWidth, comressionHeight);
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(comressionSize);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, comressionSize.width, comressionSize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

@end
