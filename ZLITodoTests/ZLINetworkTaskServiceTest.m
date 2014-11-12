#import <Typhoon/Typhoon.h>

#import "ZLINetworkAssembly.h"
#import "ZLINetworkTaskService.h"
#import "ZLITask.h"

#import <Kiwi/Kiwi.h>

SPEC_BEGIN(NetworkTaskService)

describe(@"task service", ^{
    __block ZLINetworkAssembly *networkAssembly = nil;
    __block ZLINetworkTaskService *taskService = nil;

    beforeAll(^{
        networkAssembly = (ZLINetworkAssembly *)[TyphoonBlockComponentFactory factoryWithAssemblies:@[
            [ZLINetworkAssembly assembly]
        ]];
        taskService = [networkAssembly ZLINetworkTaskService];
    });

    context(@"normal operation", ^{
        it(@"able to get a list of tasks", ^{
            __block NSArray *resultTasks = nil;
            __block ZLITask *firstTask = nil;

            [taskService getTasks:^(NSArray *tasks, NSError *error) {
                resultTasks = tasks;
                firstTask = resultTasks[0];
                ;
            }];

            [[expectFutureValue(resultTasks) shouldEventuallyBeforeTimingOutAfter(2.0)] beNonNil];
            [[expectFutureValue(resultTasks) shouldEventuallyBeforeTimingOutAfter(2.0)] haveCountOf:3];

            [[expectFutureValue(theValue(firstTask.ID)) shouldEventuallyBeforeTimingOutAfter(2.0)] equal:theValue(1)];
            [[expectFutureValue(firstTask.description) shouldEventuallyBeforeTimingOutAfter(2.0)] equal:@"Buy food"];
            [[expectFutureValue(theValue(firstTask.complete)) shouldEventuallyBeforeTimingOutAfter(2.0)] beNo];
        });
    });
});

SPEC_END
