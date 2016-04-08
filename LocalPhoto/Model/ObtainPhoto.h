/**
 *  @file
 *  @author 张凡
 *  @date 2016/3/29
 */
#import <Foundation/Foundation.h>

/**
 *  @class ObtainPhoto
 *  @brief 获取手机本地图所有图片
 *  @author 张凡
 *  @date 2016/3/29
 */

@interface ObtainPhoto : NSObject

/// @brief 获取手机所有图片(以block的方式返回数据,数组中每个元素都是UIImage)
- (void)obtainAllPhoto:(void(^)(NSMutableArray *array))success;

@end
