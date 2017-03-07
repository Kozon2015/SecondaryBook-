//
//  personInfoTableViewCell.m
//  SecondaryBook
//
//  Created by Albert on 16/5/27.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import "personInfoTableViewCell.h"
#import "BRNetworkRequests.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation personInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHeadImage:(NSString *)url {
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:url]];
}

-(void)getHeaderInfo {
    [BRNetworkRequests GET:[APIs APIGETUserInfo] parameters:nil success:^(id obj) {
        if ([[obj objectForKey:@"success"] boolValue]) {
            NSDictionary *data = [obj objectForKey:@"data"];
            [self setHeadImage:data[@"avatar"]];
            self.nameLabel.text = data[@"name"];
            self.emailLabel.text = data[@"account"];
        }
        else {

        }
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
