#import "ZLITask.h"

@implementation ZLITask

- (instancetype)initWithID:(NSString *)ID description:(NSString *)description complete:(BOOL)complete {
    self = [super init];
    if (self) {
        _ID = ID;
        _description = description;
        _complete = complete;
    }
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"ID": @"id",
        @"userId" : @"userId",
        @"description": @"description",
        @"complete": @"complete"
    };
}

@end
