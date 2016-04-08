/**
 *  @file
 *  @author 张凡
 *  @date 2016/3/30
 */
#import <Foundation/Foundation.h>

/**
 *  @class PhotoModel
 *  @brief 选取的图片Model,用于保存选取的图片
 *  @author 张凡
 *  @date 2016/3/30
 */

@interface PhotoModel : NSObject

/// @brief 用于保存图片的数组
@property (strong,nonatomic) NSMutableArray *photoArray;

@end
