#import "ZLILoginViewController.h"
#import "ZLINetworkAuthService.h"

#import <AFOAuth2Client/AFOAuth2Client.h>

@interface ZLILoginViewController ()

@property(nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property(nonatomic, weak) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonTouched:(UIButton *)sender;

@end

@implementation ZLILoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self resetTextField];
}

- (IBAction)loginButtonTouched:(UIButton *)sender {
    if ([self.usernameTextField.text length] == 0 ||
            [self.passwordTextField.text length] == 0) {
        [self showLoginError:NSLocalizedString(@"login.error.emptyInput", nil)];

        self.passwordTextField.text = @"";

        return;
    }

    __weak __typeof__(self) weakSelf = self;
    [self.authService authWithUsername:self.usernameTextField.text
                              password:self.passwordTextField.text
                       completionBlock:^(NSError *error) {
        __typeof__(self) strongSelf = weakSelf;

        if (!error) {
            [strongSelf performSegueWithIdentifier:@"taskSegue" sender:self];
        } else {
            [strongSelf showLoginError:NSLocalizedString(@"login.error.auth", nil)];
        }
    }];
}

- (void)showLoginError:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:NSLocalizedString(@"alert.button.cancel", nil)
                                          otherButtonTitles:nil,
                                                            nil];
    [alert show];
}

- (void)resetTextField {
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
}

@end
