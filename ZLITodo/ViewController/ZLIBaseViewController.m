#import "ZLIBaseViewController.h"


@implementation ZLIBaseViewController

- (void)showError {
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:nil
                                                         message:@"Error occured"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
    [errorAlert show];
}

@end