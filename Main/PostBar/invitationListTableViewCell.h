//
//  invitationListTableViewCell.h
//  SecondaryBook
//
//  Created by Albert on 16/5/15.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "invitationList.h"

@interface invitationListTableViewCell : UITableViewCell

@property (strong, nonatomic) invitationList *invitationList;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *praiseImageView;
@property (weak, nonatomic) IBOutlet UILabel *praiseLabel;
@property (weak, nonatomic) IBOutlet UIImageView *commentImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property CGFloat cellHeight;

//-(void)setCellInfo:(invitationList *)info;
-(void)setCellInfo;
@end
