#import "ZLINetworkTaskService.h"

#import "ZLITasksContainer.h"

@implementation ZLINetworkTaskService

+ (NSDictionary *)modelClassesByResourcePath {
    return @{
        @"task" : [ZLITasksContainer class]
    };
}

- (void)getTasks:(void (^)(NSArray *tasks, NSError *error))completionBlock {
    [self GET:@"task" parameters:nil completion:^(id response, NSError *error) {
        completionBlock(((ZLITasksContainer *)((OVCResponse *)response).result).tasks, error);
    }];
}

@end
