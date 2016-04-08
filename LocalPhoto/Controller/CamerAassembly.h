/**
 *  @file
 *  @author 张凡
 *  @date 2016/3/30
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PhotoModel.h"

/**
 *  @class CamerAassembly
 *  @brief 相机使用驱动类
 *  @author 张凡
 *  @date 2016/3/30
 */
@protocol CamerAassemblyPeotocol <NSObject>

/// @brief 拍照/选择照片完成事件
- (void)finishAction;

@end
@interface CamerAassembly : NSObject

/// @brief 代理
@property (strong,nonatomic) id<CamerAassemblyPeotocol> delegate;
/// @brief 相机代理
@property (strong,nonatomic) id<UIImagePickerControllerDelegate,UINavigationControllerDelegate> camerDelegate;

/// @brief 类初始化方法(初始化此类请用此方法)
- (instancetype)initWithPhotoModel:(PhotoModel *)photoModel andNavigation:(UINavigationController *)navigation;

/// @brief 相机使用驱动方法
- (void)camerDriveFunction;

/// @brief 照片库驱动方法,number为可选中的图片数量
- (void)photoLibDriveFunctionWithNumber:(NSInteger)number;

@end
