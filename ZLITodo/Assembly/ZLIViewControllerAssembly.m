#import "ZLIViewControllerAssembly.h"

#import "ZLITaskListViewController.h"

@implementation ZLIViewControllerAssembly

- (id)ZLITaskListViewController {
    return [TyphoonDefinition withClass:[ZLITaskListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(taskService) with:[self.networkAssembly ZLINetworkTaskService]];
    }];
}

@end
