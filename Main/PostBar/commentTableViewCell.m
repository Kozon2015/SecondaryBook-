//
//  commentTableViewCell.m
//  SecondaryBook
//
//  Created by Albert on 16/6/2.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "commentTableViewCell.h"

@implementation commentTableViewCell

-(void)setCellInfo {
    self.image.image = [UIImage imageNamed:@"user"];
    self.nameLabel.text = @"kozon";
    self.timeLabel.text = @"5-12 23:50";
    self.contentLabel.text = @"首盘：薇薇率先发球，首局薇薇0-40连追五分惊险保发（1-0）第二局港妹40平连得两分（1-1）第三局薇薇局分40-15连丢三分送出破发点，破发点上薇薇高质量一发直接得分，随后薇薇浪费一个局点但在第三次占先上发球直得（2-1）第四局首盘：薇薇率先发球，首局薇薇0-40连追五分惊险保发（1-0）";
    CGRect tmpRect = [self.contentLabel.text boundingRectWithSize:CGSizeMake(self.bounds.size.width - self.image.frame.size.width - 24, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.contentLabel.font,NSFontAttributeName, nil] context:nil];
    self.contentLabel.frame = CGRectMake(8, CGRectGetMaxY(self.timeLabel.frame) + 8, self.bounds.size.width - 16, tmpRect.size.height);
    self.commentButton.frame = CGRectMake(self.frame.size.width - self.commentButton.frame.size.width - 8, CGRectGetMaxY(self.contentLabel.frame) + 8, self.commentButton.frame.size.width , self.commentButton.frame.size.height );
    self.cellHeight = CGRectGetMaxY(self.commentButton.frame) + 8;
}

@end
