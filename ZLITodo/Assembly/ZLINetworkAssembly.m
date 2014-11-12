#import "ZLINetworkAssembly.h"

#import "ZLINetworkTaskService.h"

@implementation ZLINetworkAssembly

- (id)ZLINetworkTaskService {
    return [TyphoonDefinition withClass:[ZLINetworkTaskService class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithBaseURL:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSURL URLWithString:@"http://localhost:8080/"]];
        }];
    }];
}

@end
