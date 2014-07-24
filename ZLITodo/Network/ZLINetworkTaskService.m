#import "ZLINetworkTaskService.h"

#import "ZLITask.h"

@implementation ZLINetworkTaskService

+ (NSDictionary *)modelClassesByResourcePath {
    return @{
        @"task" : [ZLITask class]
    };
}

- (void)getTasks:(void (^)(NSArray *tasks, NSError *error))completionBlock {
    [self GET:@"task" parameters:nil completion:^(id response, NSError *error) {
        completionBlock(((OVCResponse *)response).result, error);
    }];
}

@end
