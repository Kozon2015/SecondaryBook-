//
//  passwordSettingViewController.m
//  SecondaryBook
//
//  Created by Albert on 16/6/1.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "passwordSettingViewController.h"
#import "JGProgressHUD.h"
#import "AFHTTPSessionManager.h"
#import "APIs.h"

@interface passwordSettingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainTextField;
@property (weak, nonatomic) IBOutlet UIButton *alterButton;
@end

@implementation passwordSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.oldTextField.layer.cornerRadius = 3.0;
    self.passwordTextField.layer.cornerRadius = 3.0;
    self.passwordAgainTextField.layer.cornerRadius = 3.0;
    self.alterButton.layer.cornerRadius = 3.0;
    
    self.oldTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.passwordAgainTextField.delegate = self;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    // Do any additional setup after loading the view.
}

//点击屏幕空白处去掉键盘
-(void)keyboardHide:(UITapGestureRecognizer*)tap {
    [self.oldTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.passwordAgainTextField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.oldTextField resignFirstResponder]) {
        [self.passwordTextField becomeFirstResponder];
    }
    else if([self.passwordTextField resignFirstResponder]){
        [self.passwordAgainTextField becomeFirstResponder];
    }
    else {
        [self.passwordAgainTextField resignFirstResponder];
    }
    return YES;
}

- (IBAction)alter:(id)sender {
//    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (status) {
//            if ([self.passwordTextField.text isEqualToString:@""] || [self.passwordAgainTextField.text isEqualToString:@""]) {
//                [self showHUD:@"密码不能为空！"];
//            }
//            else if (self.passwordTextField.text.length < 6) {
//                [self showHUD:@"请输入6位以上的密码！"];
//            }
//            else if (self.passwordTextField.text!=self.passwordAgainTextField.text) {
//                [self showHUD:@"新密码输入不一致！"];
//            }
//            else {
//                [self checkIfPasswordMatch];
//            }
//        }
//        else {
//            [self showHUD:@"无网络连接" :@"请检查您的网络连接"];
//        }
//    }];
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)checkIfPasswordMatch {
//    NSURL *URL = [NSURL URLWithString:[APIs APIResetPassword]];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    // 输入的原密码，新密码放在字典里面
//    NSDictionary *parm;
//    parm = @{@"rid":UserID,@"password":self.oldTextField.text,@"newpassword":self.passwordTextField.text};
//    [manager POST:URL.absoluteString parameters:parm progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSNumber *status = [responseObject objectForKey:@"status"];
//        
//        if ([status isEqualToNumber:[[NSNumber alloc] initWithInt:0]]) {
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"密码修改成功,请重新登陆！" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * confirmAction) {
//                UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"login" bundle:nil];
//                UIViewController *login = [mainStoryBoard instantiateViewControllerWithIdentifier:@"loginViewController"];
//                [self presentViewController:login animated:YES completion:nil];
//            }];
//            [alert addAction:confirmAction];
//            [self presentViewController:alert animated:YES completion:nil];
//            
//        }
//        else if ([status isEqualToNumber:[[NSNumber alloc]initWithInt:404]]) {
//            [self showHUD:@"原密码出错！"];
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    }];
}

-(void)showHUD :(NSString *)message :(NSString *)detailMessage{
    JGProgressHUD *HUD = [[JGProgressHUD alloc] initWithStyle:JGProgressHUDStyleLight];
    HUD.indicatorView = [[JGProgressHUDErrorIndicatorView alloc]init];
    HUD.square = YES;
    HUD.textLabel.text = message;
    HUD.detailTextLabel.text = detailMessage;
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:1.5];
}

-(void)showHUD :(NSString *)message{
    JGProgressHUD *HUD = [[JGProgressHUD alloc] initWithStyle:JGProgressHUDStyleLight];
    HUD.indicatorView = [[JGProgressHUDErrorIndicatorView alloc]init];
    HUD.square = YES;
    HUD.textLabel.text = message;
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:1.5];
}

- (IBAction)retrievePassword:(id)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"login" bundle:nil];
    UIViewController *password = [mainStoryBoard instantiateViewControllerWithIdentifier:@"forgetPasswordEnterPhoneNumerViewController"];
    [self.navigationController pushViewController:password animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
