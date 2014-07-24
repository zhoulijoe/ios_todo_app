#import <AFOAuth2Client/AFOAuth2Client.h>

@class ZLINetworkTokenStore;

@interface ZLINetworkAuthService : AFOAuth2Client

@property(strong, nonatomic) ZLINetworkTokenStore *tokenStore;

- (void) authWithUsername:(NSString *)username
                 password:(NSString *)password
          completionBlock:(void(^)(NSError *error))completionBlock;

@end