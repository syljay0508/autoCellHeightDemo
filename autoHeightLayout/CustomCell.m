//
//  CustomCell.m
//  autoHeightLayout
//
//  Created by 孙英伦 on 15/5/26.
//  Copyright (c) 2015年 Keep. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()

@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;


@end

@implementation CustomCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    // Fix the bug in iOS7 - initial constraints warning
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setData:(CellData *)data{
    if (data.content) {
        self.content.text = data.content;
    }
    if (data.image) {
        self.contentImage.image = data.image;
    }
}

@end
