#import "ZLINetworkAuthService.h"
#import "ZLINetworkTokenStore.h"


@implementation ZLINetworkAuthService

- (void)authWithUsername:(NSString *)username
                password:(NSString *)password
         completionBlock:(void (^)(NSError *error))completionBlock {
    __weak __typeof__(self) weakSelf = self;
    [self authenticateUsingOAuthWithPath:@"oauth/token"
                                username:username
                                password:password
                                   scope:@"read"
                                 success:^(AFOAuthCredential *credential) {
        __typeof__(self) strongSelf = weakSelf;

        NSLog(@"I have a token! %@", credential.accessToken);

        strongSelf.tokenStore.authToken = credential.accessToken;
        completionBlock(nil);
    }
                                 failure:^(NSError *error) {
        NSLog(@"Error: %@", error);
        completionBlock(error);
    }];
}

@end