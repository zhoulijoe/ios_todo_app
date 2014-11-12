#import "ZLITask.h"

@implementation ZLITask

- (instancetype)initWithID:(NSInteger)ID description:(NSString *)description complete:(BOOL)complete {
    self = [super init];
    if (self) {
        _ID = ID;
        _description = description;
        _complete = complete;
    }
    return self;
}

@end
