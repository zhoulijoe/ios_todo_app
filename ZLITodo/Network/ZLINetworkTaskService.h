#import "ZLINetworkBaseService.h"

@interface ZLINetworkTaskService : ZLINetworkBaseService

- (void)getTasks:(void (^)(NSArray *tasks, NSError *error))completionBlock;

@end
