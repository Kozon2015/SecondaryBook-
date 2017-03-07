//
//  loginViewController.m
//  SecondaryBook
//
//  Created by Albert on 16/4/16.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()
@property (weak, nonatomic) IBOutlet UIView *accoutView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.accoutView.layer.cornerRadius = 3.0;
    self.passwordView.layer.cornerRadius = 3.0;
    self.loginButton.layer.cornerRadius = 3.0;
    // Do any additional setup after loading the view.
}

- (IBAction)login:(id)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"MainPage" bundle:nil];
    UIViewController *login = [mainStoryBoard instantiateViewControllerWithIdentifier:@"login"];
    [self presentViewController:login animated:YES completion:nil];
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
