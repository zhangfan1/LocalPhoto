/**
 *  @file
 *  @author 张凡
 *  @date 2016/3/30
 */
#import <UIKit/UIKit.h>
#import "PhotoModel.h"

/**
 *  @class PhotoView
 *  @brief 照片集合视图
 *  @author 张凡
 *  @date 2016/3/30
 */
@interface PhotoView : UIView

/// @brief number:可选择的图片数量
- (instancetype)initWithFrame:(CGRect)frame andNumber:(NSInteger)number;

/// @brief 用于保存图片的Model
@property (strong,nonatomic) PhotoModel *photoModel;
/// @brief 图片选中/取消选中点击事件block回调函数
@property (strong,nonatomic) void(^chooseBlock)();

@end
