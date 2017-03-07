//
//  invitationTableViewCell.m
//  SecondaryBook
//
//  Created by Albert on 16/5/4.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "invitationTableViewCell.h"
#import "invitation.h"

@interface invitationTableViewCell()

@end

@implementation invitationTableViewCell

#pragma  设置帖子数据
//-(void)setCellInfo:(invitation *)info {
//    self.titleLabel.text = info.title;
//    self.authorImageView.image = info.authorImage;
//    self.nameLabel.text = info.name;
//    self.timeLabel.text = info.time;
//    self.contentLabel.text = info.content;
//    self.contentImageView.image = info.contentImage;
//    self.praiseImageView.image = info.praiseImage;
//}

-(void)setCellInfo {
    self.titleLabel.text = @"【豆子】丢掉首盘，还能逆转不？";
    self.authorImageView.image = [UIImage imageNamed:@"user"];
    self.nameLabel.text = @"kozon";
    self.timeLabel.text = @"5-12 23:50";
    self.contentLabel.text = @"首盘：薇薇率先发球，首局薇薇0-40连追五分惊险保发（1-0）第二局港妹40平连得两分（1-1）第三局薇薇局分40-15连丢三分送出破发点，破发点上薇薇高质量一发直接得分，随后薇薇浪费一个局点但在第三次占先上发球直得（2-1）第四局，薇薇三次回合失分，依靠两个追身发球和一次相持放短追平比分，关键分上薇薇又是一个追身发球拿到局点，不过随后连续两个受迫失误又送出第四个破发点，破发点上薇薇多拍相持正拍非受迫失误（2-3）随后四局比分交替上升（4-5）第十局，薇薇在对手的发球胜盘局上拿到连续三个破发点，第一个破发点上港妹打出一记正拍压线制胜分，紧接着薇薇接发失误，第三个破发点上薇薇在底线和对手耐心周旋终于等到对手击球失误（5-5）随后两人各自保发一局（6-6）抢七中，两人一度战至3-3平，关键比分薇薇连续两个正拍直线制胜分5-3，随后两人各送出一个正拍失误，薇薇6-4率先拿到盘点，不过两次机会都没能把握住6-6，关键分薇薇正拍失误，对手拿到盘点，薇薇网前正拍截击制胜分化解，对手双误，薇薇第三次拿到盘点，盘点上的多拍相持港妹出现失误9-7（7-6）首盘：薇薇率先发球，首局薇薇0-40连追五分惊险保发（1-0）第二局港妹40平连得两分（1-1）第三局薇薇局分40-15连丢三分送出破发点，破发点上薇薇高质量一发直接得分，随后薇薇浪费一个局点但在第三次占先上发球直得（2-1）第四局，薇薇三次回合失分，依靠两个追身发球和一次相持放短追平比分，关键分上薇薇又是一个追身发球拿到局点，不过随后连续两个受迫失误又送出第四个破发点，破发点上薇薇多拍相持正拍非受迫失误（2-3）随后四局比分交替上升（4-5）第十局，薇薇在对手的发球胜盘局上拿到连续三个破发点，第一个破发点上港妹打出一记正拍压线制胜分，紧接着薇薇接发失误，第三个破发点上薇薇在底线和对手耐心周旋终于等到对手击球失误（5-5）随后两人各自保发一局（6-6）抢七中，两人一度战至3-3平，关键比分薇薇连续两个正拍直线制胜分5-3，随后两人各送出一个正拍失误，薇薇6-4率先拿到盘点，不过两次机会都没能把握住6-6，关键分薇薇正拍失误，对手拿到盘点，薇薇网前正拍截击制胜分化解，对手双误，薇薇第三次拿到盘点，盘点上的多拍相持港妹出现失误9-7（7-6）";
    self.contentImageView.image = [UIImage imageNamed:@"book"];
    self.praiseImageView.image = [UIImage imageNamed:@"praise"];
    //正文
    CGRect tmpRect = [self.contentLabel.text boundingRectWithSize:CGSizeMake(self.bounds.size.width - 16, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.contentLabel.font,NSFontAttributeName, nil] context:nil];
    self.contentLabel.frame = CGRectMake(8, CGRectGetMaxY(self.authorImageView.frame) + 8, self.bounds.size.width - 16, tmpRect.size.height);
    if (self.contentImageView.image) {
        self.praiseImageView.frame = CGRectMake(8, CGRectGetMaxY(self.contentLabel.frame) + self.contentImageView.frame.size.height + 16, self.praiseImageView.frame.size.width, self.praiseImageView.frame.size.height);
        self.cellHeight = CGRectGetMaxY(self.praiseImageView.frame) + 8;
    }
    else {
        self.praiseImageView.frame = CGRectMake(8, CGRectGetMaxY(self.contentLabel.frame) + 8, self.praiseImageView.frame.size.width, self.praiseImageView.frame.size.height);
        self.cellHeight = CGRectGetMaxY(self.praiseImageView.frame) + 8;
    }
}

@end
