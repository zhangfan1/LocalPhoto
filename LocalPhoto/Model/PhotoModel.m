#import "PhotoModel.h"

@implementation PhotoModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.photoArray = [NSMutableArray array];
    }
    
    return self;
}

@end
