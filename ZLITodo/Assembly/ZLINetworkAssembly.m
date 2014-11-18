#import "ZLINetworkAssembly.h"

#import "ZLINetworkTaskService.h"
#import "ZLINetworkTokenStore.h"
#import "ZLINetworkAuthService.h"

@implementation ZLINetworkAssembly

- (id)ZLINetworkTokenStore {
    return [TyphoonDefinition withClass:[ZLINetworkTokenStore class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id)ZLINetworkBaseService {
    return [TyphoonDefinition withClass:[ZLINetworkBaseService class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(tokenStore) with:[self ZLINetworkTokenStore]];
    }];
};

- (id)ZLINetworkAuthService {
    return [TyphoonDefinition withClass:[ZLINetworkAuthService class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;

        [definition useInitializer:@selector(initWithBaseURL:clientID:secret:)
                        parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSURL URLWithString:@"http://10.20.1.2/todo/"]];
            [initializer injectParameterWith:@"todo-client"];
            [initializer injectParameterWith:@"secret"];
        }];

        [definition injectProperty:@selector(tokenStore) with:[self ZLINetworkTokenStore]];
    }];
}

- (id)ZLINetworkTaskService {
    return [TyphoonDefinition withClass:[ZLINetworkTaskService class]
                          configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
        definition.parent = [self ZLINetworkBaseService];

        [definition useInitializer:@selector(initWithBaseURL:)
                        parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSURL URLWithString:@"http://10.20.1.2/todo/"]];
        }];
    }];
}

@end
