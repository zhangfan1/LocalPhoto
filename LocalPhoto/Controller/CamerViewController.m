//
//  CamerViewController.m
//  YXB
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 ZhangFan. All rights reserved.
//

#import "CamerViewController.h"

@interface CamerViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/// @brief 调用类型
@property (assign,nonatomic) UIImagePickerControllerSourceType sourceType;

@property (strong,nonatomic) UIImagePickerController *picker;

@end

@implementation CamerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //保存的相片
    self.picker = [[UIImagePickerController alloc] init];//初始化
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;//设置可编辑
    self.sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    self.picker.sourceType = self.sourceType;
    [self presentViewController:self.picker animated:YES completion:nil];
}

#pragma mark - 相机使用驱动方法
- (void)camerDriveFunction
{
    //保存的相片
    self.picker = [[UIImagePickerController alloc] init];//初始化
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;//设置可编辑
    self.sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    self.picker.sourceType = self.sourceType;
    [self presentViewController:self.picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"ass--");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"//");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
