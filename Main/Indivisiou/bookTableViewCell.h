//
//  bookTableViewCell.h
//  SecondaryBook
//
//  Created by Albert on 16/6/4.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *editorLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
