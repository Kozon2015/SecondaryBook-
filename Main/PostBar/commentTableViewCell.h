//
//  commentTableViewCell.h
//  SecondaryBook
//
//  Created by Albert on 16/6/2.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface commentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property CGFloat cellHeight;

-(void)setCellInfo;
@end
