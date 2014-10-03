#import "ZLITask.h"

@implementation ZLITask

- (instancetype)initWithID:(NSString *)ID desc:(NSString *)desc complete:(BOOL)complete {
    self = [super init];
    if (self) {
        _ID = ID;
        _desc = desc;
        _complete = complete;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"ID": @"id",
        @"userId" : @"userId",
        @"desc": @"description",
        @"complete": @"complete"
    };
}

@end
