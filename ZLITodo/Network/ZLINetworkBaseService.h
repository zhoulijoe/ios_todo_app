#import <Overcoat/Overcoat.h>

@class ZLINetworkTokenStore;


@interface ZLINetworkBaseService : OVCHTTPRequestOperationManager

@property(strong, nonatomic) ZLINetworkTokenStore *tokenStore;

@end