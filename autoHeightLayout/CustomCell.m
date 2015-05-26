//
//  CustomCell.m
//  autoHeightLayout
//
//  Created by 孙英伦 on 15/5/26.
//  Copyright (c) 2015年 Keep. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()



@end

@implementation CustomCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    // Fix the bug in iOS7 - initial constraints warning
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}



@end
