//
//  replyViewController.m
//  SecondaryBook
//
//  Created by Albert on 16/5/4.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "replyViewController.h"

@interface replyViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *replyTextView;
@property (strong, nonatomic) UILabel *replyPlaceholder;

@end

@implementation replyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.replyPlaceholder = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, CGRectGetWidth(self.self.replyTextView.frame), 20)];
    self.replyPlaceholder.backgroundColor = [UIColor clearColor];
    self.replyPlaceholder.textColor = [UIColor colorWithRed:200.0/255.0 green:199.0/255.0 blue:205.0/255.0 alpha:1.0];
    self.replyPlaceholder.text = @"来说两句";
    self.replyPlaceholder.font = self.replyTextView.font;
    [self.replyTextView addSubview:self.replyPlaceholder];
    // Do any additional setup after loading the view.
}

- (IBAction)comment:(id)sender {
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
