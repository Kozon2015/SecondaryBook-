//
//  BookListTableViewCell.h
//  SecondaryBook
//
//  Created by Albert on 16/5/2.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookPriceLabel;
@end
