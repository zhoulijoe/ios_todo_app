#import "ZLINetworkTaskService.h"

#import "ZLITask.h"

@implementation ZLINetworkTaskService

- (void)getTasks:(void (^)(NSArray *tasks, NSError *error))completionBlock {
    [self GET:@"tasks" parameters:nil resultClass:[ZLITask class] resultKeyPath:nil
   completion:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        completionBlock((NSArray *)responseObject, error);
   }];
}

@end
