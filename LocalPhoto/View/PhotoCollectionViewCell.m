#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize size = frame.size;
        /// @brief 图片
        self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        [self.contentView addSubview:self.photoView];
        
        /// @brief 选择按钮
        /// @brief 图片大小
        UIImage *image = [UIImage imageNamed:@"pic_wei"];
        self.chooseOrCancelButton = [[UIButton alloc] initWithFrame:CGRectMake(size.width - image.size.width - 3, 3, image.size.width, image.size.height)];
        [self.chooseOrCancelButton setImage:image forState:UIControlStateNormal];
        [self.contentView addSubview:self.chooseOrCancelButton];
    }
    
    return self;
}

@end
