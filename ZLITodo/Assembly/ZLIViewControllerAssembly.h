#import <Typhoon/Typhoon.h>

#import "ZLINetworkAssembly.h"

@interface ZLIViewControllerAssembly : TyphoonAssembly

@property (strong, nonatomic, readonly) ZLINetworkAssembly *networkAssembly;

- (id)ZLITaskListViewController;

@end
