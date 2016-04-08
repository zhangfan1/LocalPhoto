/**
 *  @file
 *  @author 张凡
 *  @date 2016/3/30
 */
#import <UIKit/UIKit.h>
#import "PhotoModel.h"

/**
 *  @class PhotoLibCollectionViewController
 *  @brief 本地图片库图片选择控制器
 *  @author 张凡
 *  @date 2016/3/30
 */
@interface PhotoLibViewController : UIViewController

/// @brief photoModel参数用于保存选取的图片的对象(如果既使用相机又使用图片库请保证PhotoModel是同一个对象,number:可选多少张图片)
- (instancetype)initWithPhotoModel:(PhotoModel *)photoModel andNumber:(NSInteger)number;
/// @brief 完成按钮点击回调block函数
@property (strong,nonatomic) void(^finishBlock)();

@end
