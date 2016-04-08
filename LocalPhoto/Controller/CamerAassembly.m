#import "CamerAassembly.h"
#import "PhotoLibViewController.h"
#import "CamerViewController.h"

@interface CamerAassembly ()

/// @brief 用于保存选取的图片的对象
@property (strong,nonatomic) PhotoModel *photoModel;
/// @brief 跳转使用的导航控制器
@property (strong,nonatomic) UINavigationController *navigation;
/// @brief 调用类型
@property (assign,nonatomic) UIImagePickerControllerSourceType sourceType;

@property (strong,nonatomic) UIImagePickerController *picker;

@end
@implementation CamerAassembly

#pragma mark - 类初始化方法(初始化此类请用此方法)
- (instancetype)initWithPhotoModel:(PhotoModel *)photoModel andNavigation:(UINavigationController *)navigation
{
    self = [super init];
    if (self) {
        self.navigation = navigation;
        self.photoModel = photoModel;
    }
    
    return self;
}

#pragma mark - 相机使用驱动方法
- (void)camerDriveFunction
{
    //保存的相片
    self.picker = [[UIImagePickerController alloc] init];//初始化
    self.picker.delegate = self.camerDelegate;
    self.picker.allowsEditing = YES;//设置可编辑
    self.sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    self.picker.sourceType = self.sourceType;
    [self.navigation presentViewController:self.picker animated:YES completion:nil];
    
//    CamerViewController *camerView = [[CamerViewController alloc] init];
//    [self.navigation presentViewController:camerView animated:YES completion:nil];
}

#pragma mark - 照片库驱动方法
- (void)photoLibDriveFunctionWithNumber:(NSInteger)number
{
    /// @brief 图片库
    PhotoLibViewController *photo = [[PhotoLibViewController alloc] initWithPhotoModel:self.photoModel andNumber:number];
    photo.hidesBottomBarWhenPushed = YES;
    photo.finishBlock = ^(){
        [self.delegate finishAction];
    };
    [self.navigation pushViewController:photo animated:YES];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"ass--");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"//");
}

@end
