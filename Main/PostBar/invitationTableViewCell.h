//
//  invitationTableViewCell.h
//  SecondaryBook
//
//  Created by Albert on 16/5/4.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "invitation.h"

@interface invitationTableViewCell : UITableViewCell

@property (strong, nonatomic) invitation *invitation;
@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UIImageView *authorImageView;
@property (nonatomic,strong) IBOutlet UILabel *nameLabel;
@property (nonatomic ,strong) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong) IBOutlet UILabel *contentLabel;
@property (nonatomic,strong) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UIImageView *praiseImageView;
@property CGFloat cellHeight;

//-(void)setCellInfo:(invitation *)info;
-(void)setCellInfo;

@end
