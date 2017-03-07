//
//  imageTableViewCell.h
//  SecondaryBook
//
//  Created by Albert on 16/6/4.
//  Copyright © 2016年 625 Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
 @property (nonatomic, strong) NSTimer *timer;
@end
