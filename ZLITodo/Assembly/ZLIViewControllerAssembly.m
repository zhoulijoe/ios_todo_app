#import "ZLIViewControllerAssembly.h"

#import "ZLITaskListViewController.h"
#import "ZLILoginViewController.h"

@implementation ZLIViewControllerAssembly

- (id)ZLILoginViewController {
    return [TyphoonDefinition withClass:[ZLILoginViewController class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(authService) with:[self.networkAssembly ZLINetworkAuthService]];
    }];
}

- (id)ZLITaskListViewController {
    return [TyphoonDefinition withClass:[ZLITaskListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(taskService) with:[self.networkAssembly ZLINetworkTaskService]];
    }];
}

@end
