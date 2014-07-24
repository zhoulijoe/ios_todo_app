#import "ZLINetworkBaseService.h"
#import "ZLINetworkTokenStore.h"


@implementation ZLINetworkBaseService

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(NSDictionary *)parameters
                     completion:(void (^)(id response, NSError *error))completion {
    [self setAuthorizationHeader];

    return [super GET:URLString parameters:parameters completion:completion];
}

- (void)setAuthorizationHeader {
    if (self.tokenStore.authToken) {
        [self.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", self.tokenStore.authToken]
                      forHTTPHeaderField:@"Authorization"];
    }
}

@end