#import "Kiwi.h"

SPEC_BEGIN(BuildConfiguration)

describe(@"Build configuration used is", ^{
    it(@"available during run time", ^{
        NSString *configuration = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Configuration"];
        NSLog(@"The current build configuration is: %@", configuration);
        [[configuration should] beNonNil];
    });
});

SPEC_END
