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

@implementation RootTableViewController{
    NSMutableArray *_dataArr;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    _dataArr = [NSMutableArray array];
    
    
    self.tableView.estimatedRowHeight = 150;
    self.tableView.fd_debugLogEnabled = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
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
