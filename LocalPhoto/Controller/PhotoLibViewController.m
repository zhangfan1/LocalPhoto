#import "PhotoLibViewController.h"
#import "PhotoView.h"
#import "ZFToast.h"

@interface PhotoLibViewController ()

/// @brief 用于保存选取的图片的对象
@property (strong,nonatomic) PhotoModel *photoModel;
/// @brief 底部视图
@property (strong,nonatomic) UIView *bottomView;
/// @brief 预览按钮
@property (strong,nonatomic) UIButton *previewButton;
/// @brief 确定按钮
@property (strong,nonatomic) UIButton *finishButton;
/// @brief 可选多少张图片
@property (assign,nonatomic) NSInteger number;

@end

@implementation PhotoLibViewController

- (instancetype)initWithPhotoModel:(PhotoModel *)photoModel andNumber:(NSInteger)number
{
    self = [super init];
    if (self) {
        self.photoModel = photoModel;
        self.number = number;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /// @brief 初始化view
    [self initView];
    /// @brief 定制导航条Item
    [self customNavigationItem];
    /// @breif 创建底部视图
    [self createBottomView];
    /// @brief 创建照片视图
    [self createPhotoView];
    
}

#pragma mark - 初始化View
- (void)initView
{
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 定制导航条Item
- (void)customNavigationItem
{
    self.navigationItem.title = @"相册";
    /// @brief 定制导航条右侧按钮
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(closeController)];
    self.navigationItem.rightBarButtonItem = closeItem;
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"";
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
}

#pragma mark - 创建底部视图
- (void)createBottomView
{
    /// @brief 底部视图的高
    CGFloat bottomViewHeight = 40;
    CGSize size = self.view.frame.size;
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, size.height - bottomViewHeight - [self obtainNavigationHeight], size.width, bottomViewHeight)];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bottomView];
    
    /// @brief 创建预览按钮
    self.previewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, self.bottomView.frame.size.height)];
    [self.previewButton setTitle:@"预览" forState:UIControlStateNormal];
    [self.previewButton setTitleColor:[UIColor colorWithRed:184.0/255.0 green:184.0/255.0 blue:184.0/255.0 alpha:1] forState:UIControlStateNormal];
    [self.previewButton addTarget:self action:@selector(previewAction) forControlEvents:UIControlEventTouchUpInside];
    self.previewButton.userInteractionEnabled = NO;
    [self.bottomView addSubview:self.previewButton];
    
    /// @brief 创建完成按钮
    /// @brief 按钮的宽
    CGFloat finishWidth = 70;
    self.finishButton = [[UIButton alloc] initWithFrame:CGRectMake(size.width - finishWidth, 0, finishWidth, self.previewButton.frame.size.height)];
    [self.finishButton setTitle:@"完成" forState:UIControlStateNormal];
    [self.finishButton setTitleColor:[UIColor colorWithRed:168.0/255.0 green:226.0/255.0 blue:248.0/255.0 alpha:1] forState:UIControlStateNormal];
    [self.finishButton addTarget:self action:@selector(finishAction) forControlEvents:UIControlEventTouchUpInside];
    self.finishButton.userInteractionEnabled = NO;
    [self.bottomView addSubview:self.finishButton];
}

#pragma mark - 创建照片视图
- (void)createPhotoView
{
    CGSize size = self.view.frame.size;
    PhotoView *photo = [[PhotoView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height - [self obtainNavigationHeight] - self.bottomView.frame.size.height)];
    photo.photoModel = self.photoModel;
    photo.chooseBlock = ^(){
        [self PhotoChooseOrCancelAction];
    };
    [self.view addSubview:photo];
}

#pragma mark - 预览事件
- (void)previewAction
{
    NSLog(@"预览");
}

#pragma mark - 完成事件
- (void)finishAction
{
    [self.navigationController popViewControllerAnimated:YES];
    self.finishBlock();
}

#pragma mark - 关闭控制器
- (void)closeController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 获取导航条高度与状态栏的高度和
- (CGFloat)obtainNavigationHeight
{
    return self.navigationController.navigationBar.frame.size.height + 20;
}

#pragma mark - 图片选中/取消选中时进行的处理
- (void)PhotoChooseOrCancelAction
{
    if (self.photoModel.photoArray.count > 0) {
        [self.previewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.previewButton.userInteractionEnabled = YES;
        [self.finishButton setTitleColor:[UIColor colorWithRed:40.0/255.0 green:183.0/255.0 blue:245.0/25.0 alpha:1] forState:UIControlStateNormal];
        self.finishButton.userInteractionEnabled = YES;
    }
    else{
        [self.previewButton setTitleColor:[UIColor colorWithRed:184.0/255.0 green:184.0/255.0 blue:184.0/255.0 alpha:1] forState:UIControlStateNormal];
        self.previewButton.userInteractionEnabled = NO;
        [self.finishButton setTitleColor:[UIColor colorWithRed:168.0/255.0 green:226.0/255.0 blue:248.0/255.0 alpha:1] forState:UIControlStateNormal];
        self.finishButton.userInteractionEnabled = NO;
    }
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
