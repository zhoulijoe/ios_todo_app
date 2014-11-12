#import <Overcoat/OVCClient.h>

@interface ZLINetworkTaskService : OVCClient

- (void)getTasks:(void (^)(NSArray *tasks, NSError *error))completionBlock;

@end
