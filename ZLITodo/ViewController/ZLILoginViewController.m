#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ZLILoginViewController.h"
#import "ZLINetworkAuthService.h"

#import <AFOAuth2Client/AFOAuth2Client.h>

@interface ZLILoginViewController ()

@property(nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property(nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

@implementation ZLILoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *disabledTextColor = [UIColor colorWithRed:.6 green:.9 blue:1 alpha:1];
    UIColor *defaultBgColor = [UIColor colorWithRed:.34 green:.84 blue:1 alpha:1];
    [self.loginButton setTitleColor:defaultBgColor forState:UIControlStateDisabled];
    
    RACSignal *validUsernameSignal =
    [self.usernameTextField.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidUsername:text]);
     }];
    
    RACSignal *validPasswordSignal =
    [self.passwordTextField.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidPassword:text]);
     }];
    
    
    RAC(self.passwordTextField, backgroundColor) =
    [validPasswordSignal
     map:^id(NSNumber *passwordValid) {
         return [passwordValid boolValue] ? [UIColor whiteColor] : disabledTextColor;
     }];
    
    RAC(self.usernameTextField, backgroundColor) =
    [validUsernameSignal
     map:^id(NSNumber *passwordValid) {
         return [passwordValid boolValue] ? [UIColor whiteColor] : disabledTextColor;
     }];
    
    RACSignal *signUpActiveSignal =
    [RACSignal combineLatest:@[validUsernameSignal, validPasswordSignal]
                      reduce:^id(NSNumber *usernameValid, NSNumber *passwordValid) {
                          return @([usernameValid boolValue] && [passwordValid boolValue]);
                      }];
    
    [signUpActiveSignal subscribeNext:^(NSNumber *signupActive) {
        self.loginButton.enabled = [signupActive boolValue];
    }];
    
    [[[[self.loginButton
      rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x) {
          self.loginButton.enabled = NO;
          self.loginButton.hidden = YES;
      }]
      flattenMap:^(id x) {
          return [self signInSignal];
      }]
      subscribeNext:^(NSError *error) {
          self.loginButton.enabled = YES;
          self.loginButton.hidden = NO;
          if (!error) {
              [self performSegueWithIdentifier:@"taskSegue" sender:self];
          }
          else {
              [self showLoginError:NSLocalizedString(@"login.error.auth", nil)];
          }
      }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self resetTextField];
}

-(RACSignal *)signInSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.authService authWithUsername:self.usernameTextField.text
                                  password:self.passwordTextField.text
                           completionBlock:^(NSError *error) {
            [subscriber sendNext:error];
            [subscriber sendCompleted];
         }];
        return nil;
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

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 3;
}

@end
