#import "ZLITasksContainer.h"
#import "ZLITask.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>


@implementation ZLITasksContainer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"tasks": @"tasks"
    };
}

+ (NSValueTransformer *)tasksJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:ZLITask.class];
}

@end