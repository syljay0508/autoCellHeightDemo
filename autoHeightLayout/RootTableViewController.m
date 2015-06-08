//
//  RootTableViewController.m
//  autoHeightLayout
//
//  Created by 孙英伦 on 15/5/26.
//  Copyright (c) 2015年 Keep. All rights reserved.
//

#import "RootTableViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "CustomCell.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@implementation RootTableViewController{
    NSMutableArray *_dataArr;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _dataArr = [NSMutableArray array];
    
    self.tableView.estimatedRowHeight = 150;
    self.tableView.fd_debugLogEnabled = YES;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    [self refreshData];
}

- (void)refresh{
    [self performSelector:@selector(refreshData) withObject:nil afterDelay:2];
}

- (void)refreshData{
    for (int i = 0; i < 20; i++) {
        CellData *data = [[CellData alloc] init];
        data.content = self.randomContent;
        data.image = self.randomImage;
        [_dataArr addObject:data];
    }
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (NSString *)randomContent{
    NSString *ori = @"我就是试一试文字长度能有多长";
    NSInteger times = arc4random() % 10 + 1;
    for (int i = 0; i < times; i++) {
//        ori = [ori stringByAppendingString:ori];
    }
    return ori;
}

- (UIImage *)randomImage{
    
    
    CGRect rect = CGRectMake(0.0f, 0.0f, SCREENWIDTH - 15 * 2, SCREENWIDTH - 15 * 2);
    UIColor *color = [UIColor colorWithRed:arc4random() % 11 / 10 green:arc4random() % 11 / 10 blue:arc4random() % 11 / 10 alpha:1];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *_id = nil;
    
    CellData *data = [_dataArr objectAtIndex:indexPath.row];
    
    _id = [self idOfCellData:data];
    
    return [tableView fd_heightForCellWithIdentifier:_id cacheByIndexPath:indexPath configuration:^(CustomCell *cell) {
        [cell setData:data];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellData *data = [_dataArr objectAtIndex:indexPath.row];
    
    NSString *_id = [self idOfCellData:data];
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:_id forIndexPath:indexPath];
    [cell setData:data];
    
    return cell;
}

- (NSString *)idOfCellData:(CellData *)data{
    if (data.content && data.image) {
        return @"content+image";
    }else if (data.image){
        return @"image";
    }else
        return @"content";
}


@end
