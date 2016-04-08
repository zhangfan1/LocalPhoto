/**
 *  @file
 *  @author 张凡
 *  @date 2016/3/30
 */
#import <UIKit/UIKit.h>

/**
 *  @class PhotoCollectionViewCell
 *  @brief 图片库cell样式
 *  @author 张凡
 *  @date 2016/3/30
 */

@interface PhotoCollectionViewCell : UICollectionViewCell

/// @brief 图片显示imageView
@property (strong,nonatomic) UIImageView *photoView;
/// @brief 选择/取消按钮
@property (strong,nonatomic) UIButton *chooseOrCancelButton;

@end
