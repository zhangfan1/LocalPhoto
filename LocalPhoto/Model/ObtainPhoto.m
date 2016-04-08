//
#import "ObtainPhoto.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

@implementation ObtainPhoto

#pragma mark - 获取手机所有图片(以block的方式返回数据,数组中每个元素都是UIImage)
- (void)obtainAllPhoto:(void (^)(NSMutableArray *))success
{
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    /// @brief 存放media的数组
    NSMutableArray<UIImage *> *mediaArray = [[NSMutableArray<UIImage *> alloc] init];
    /// @brief 存放media的数组
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            
        /// @brief 获取所有group
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            /// @brief 从group里面
            NSString *assetType = [result valueForProperty:ALAssetPropertyType];
            if ([assetType isEqualToString:ALAssetTypePhoto]) {
                UIImage *image = [UIImage imageWithCGImage:result.thumbnail];
                [mediaArray addObject:image];
            }
        }];
        }
        else{
            success(mediaArray);
        }
    } failureBlock:^(NSError *error) {
        

    }];
    
    
    
//    NSLog(@"%@",mediaArray);
}

@end
