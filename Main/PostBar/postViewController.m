//
//  postViewController.m
//  SecondaryBook
//
//  Created by Albert on 16/5/4.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "postViewController.h"

@interface postViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *postBarButton;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *postContentTextView;
@property (strong, nonatomic) UILabel *postPlaceholder;
@end

@implementation postViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.postPlaceholder = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.self.postContentTextView.frame), 20)];
    self.postPlaceholder.backgroundColor = [UIColor clearColor];
    self.postPlaceholder.textColor = [UIColor colorWithRed:200.0/255.0 green:199.0/255.0 blue:205.0/255.0 alpha:1.0];
    self.postPlaceholder.text = @"来说两句";
    self.postPlaceholder.font = self.postContentTextView.font;
    [self.postContentTextView addSubview:self.postPlaceholder];
    // Do any additional setup after loading the view.
}

- (IBAction)post:(id)sender {
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
