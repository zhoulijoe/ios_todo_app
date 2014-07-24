#import "ZLIBaseTableViewController.h"


@implementation ZLIBaseTableViewController

- (void)showError {
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:nil
                                                         message:@"Error occured"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
    [errorAlert show];
}

@end