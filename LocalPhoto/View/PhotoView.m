#import "PhotoView.h"
#import "PhotoCollectionViewCell.h"
#import "ObtainPhoto.h"
#import "ZFToast.h"

#define photoCellIdentity @"photoCell"
#define ScreenWidth CGRectGetWidth([[UIScreen mainScreen] bounds])
@interface PhotoView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/// @brief collectionView
@property (strong,nonatomic) UICollectionView *collectionView;
/// @brief 集合布局
@property (strong,nonatomic) UICollectionView *cv;

/// @brief 流式布局
@property (strong,nonatomic) UICollectionViewFlowLayout *fl;

/// @brief 数据源
@property (strong,nonatomic) NSMutableArray *allLocalPhoto;

/// @brief 可选中的图片数量
@property (assign,nonatomic) NSInteger number;

@end
@implementation PhotoView

- (instancetype)initWithFrame:(CGRect)frame andNumber:(NSInteger)number
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.number = number;
        /// @brief 初始化collectionView
        [self iniCollectionView];
        /// @brief 获取照片数据
        [self obtainPhotoData];
    }
    
    return self;
}

#pragma mark - 初始化collectionView
- (void)iniCollectionView
{
    self.fl = [[UICollectionViewFlowLayout alloc] init];
    self.fl.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:self.fl];
    [self addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:photoCellIdentity];
}

#pragma mark - 获取照片数据
- (void)obtainPhotoData
{
    ObtainPhoto *obtain = [[ObtainPhoto alloc] init];
    [obtain obtainAllPhoto:^(NSMutableArray *array) {
        self.allLocalPhoto = array;
        [self.collectionView reloadData];
    }];
}

#pragma mark - 代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //返回有多少段
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //返回有多少个
    return self.allLocalPhoto.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCellIdentity forIndexPath:indexPath];
    cell.photoView.image = self.allLocalPhoto[indexPath.row];
    cell.chooseOrCancelButton.tag = indexPath.row;
    [cell.chooseOrCancelButton addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

#pragma mark - 设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth - 10.0)/4.0, (ScreenWidth - 10.0)/4.0);
}

#pragma mark - 设置间距  item内部
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //设置间距  item内部
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

#pragma mark - item 之间  设置最小的列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    //item之间  设置最小的列间距
    return 2;
}

#pragma mark - item之间  设置最小的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    //item之间  设置最小的行间距
    return 2;
}

#pragma mark - 当某个Item被选择的时候调用这个方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - 照片选择
- (void)choosePhoto:(UIButton *)button
{
    if ([self.photoModel.photoArray containsObject:self.allLocalPhoto[button.tag]]) {
        [self.photoModel.photoArray removeObject:self.allLocalPhoto[button.tag]];
        [button setImage:[UIImage imageNamed:@"pic_wei"] forState:UIControlStateNormal];
        NSLog(@"存在");
    }
    else{
        if (self.photoModel.photoArray.count > self.number) {
            [[[ZFToast alloc] init] popUpToastWithMessage:[NSString stringWithFormat:@"最多可选中%ld张图片",self.number]];
        }
        else{
            [self.photoModel.photoArray addObject:self.allLocalPhoto[button.tag]];
            [button setImage:[UIImage imageNamed:@"pic_z"] forState:UIControlStateNormal];
            NSLog(@"不存在");
        }
    }
    self.chooseBlock();
}


@end
