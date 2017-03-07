//
//  logonViewController.m
//  SecondaryBook
//
//  Created by Albert on 16/4/16.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "logonViewController.h"
#import "BRNetworkRequests.h"

@interface logonViewController ()<UITextViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIView *accoutView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIView *passwordAgainView;
@property (weak, nonatomic) IBOutlet UIView *majorView;
@property (weak, nonatomic) IBOutlet UIButton *logonButton;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainTextField;
@property (weak, nonatomic) IBOutlet UITextField *majorTextField;

@end

@implementation logonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userImage.layer.cornerRadius = self.userImage.frame.size.width / 2;
    self.userImage.layer.masksToBounds = YES;
    self.userImage.layer.borderWidth = 0.5;
    self.userImage.layer.borderColor = [UIColor greenColor].CGColor;
    self.accoutView.layer.cornerRadius = 3.0;
    self.passwordView.layer.cornerRadius = 3.0;
    self.passwordAgainView.layer.cornerRadius = 3.0;
    self.majorView.layer.cornerRadius = 3.0;
    self.logonButton.layer.cornerRadius = 3.0;
    
    self.accountTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.passwordAgainTextField.delegate = self;
    self.majorTextField.delegate = self;
    
    [self.userImage setUserInteractionEnabled:YES];
    [self.userImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(uploading:)]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uploading:(UITapGestureRecognizer *)gestureRecognizer {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        alert.popoverPresentationController.sourceView = self.userImage;
        alert.popoverPresentationController.sourceRect = self.userImage.bounds;
    }
    [self presentViewController:alert animated:YES completion:nil];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        //判断是否有摄像头
        if(![UIImagePickerController isSourceTypeAvailable:sourceType]) {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = sourceType;
        imagePickerController.allowsEditing = YES;
        [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示
    }];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        UIImagePickerControllerSourceType pickerImage= UIImagePickerControllerSourceTypePhotoLibrary;
        if (![UIImagePickerController isSourceTypeAvailable:pickerImage]) {
            pickerImage = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = pickerImage;
        imagePickerController.allowsEditing = YES;
        [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:cameraAction];
    [alert addAction:photoAction];
    [alert addAction:cancelAction];
}

//完成拍照
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *img = info[@"UIImagePickerControllerEditedImage"];
    [self.userImage setImage:img];
    UIImageJPEGRepresentation(img, 1.0);
    [self dismissViewControllerAnimated:YES completion:nil];
}

//用户取消拍照
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) registerViaMail {
    [BRNetworkRequests uploadImage:[APIs APIRegister] parameters:@{@"account":self.accountTextField.text,@"password":self.passwordTextField.text,@"password2":self.passwordAgainTextField.text,@"speciality":self.majorTextField.text} imgName:@"file" image:self.userImage.image success:^(id obj) {
        if ([[obj objectForKey:@"success"] boolValue]){
            NSLog(@"成功%@",obj);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"注册成功！" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
                UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"MainPage" bundle:nil];
                UIViewController *login = [mainStoryBoard instantiateViewControllerWithIdentifier:@"login"];
                [self presentViewController:login animated:YES completion:nil];
            }];
            [alert addAction:confirm];
        }
        else {
            NSLog(@"错误%@",obj);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"注册失败！请重新注册！" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
                self.accountTextField.text = @"";
                self.passwordTextField.text = @"";
                self.passwordAgainTextField.text = @"";
                self.majorTextField.text = @"";
                self.userImage.image = [UIImage imageNamed:@""];
            }];
            [alert addAction:confirm];
        }
    } failure:^(NSError *error) {
        NSLog(@"错误：%@",error);
    }];

}

- (IBAction)registerClick:(id)sender {
    [self registerViaMail];
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
