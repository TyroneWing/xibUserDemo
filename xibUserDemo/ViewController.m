//
//  ViewController.m
//  xibUserDemo
//
//  Created by yi on 15/8/20.
//  Copyright (c) 2015年 yi. All rights reserved.
//

#import "ViewController.h"
#import "C1.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_dataArray;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //http://www.90159.com/2015/07/21/54/
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _dataArray = @[@"1\n2\n3\n4\n5\n6",
                   @"123456789012345678901234567890",
                   @"1\n2", @"1\n2\n3",
                   @"1"];
    UINib *cellNib = [UINib nibWithNibName:@"C1" bundle:nil];
    [_tableView registerNib:cellNib forCellReuseIdentifier:@"C1"];
    self.prototypeCell  = [_tableView dequeueReusableCellWithIdentifier:@"C1"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C1 *cell = [_tableView dequeueReusableCellWithIdentifier:@"C1"];
    cell.firstlabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C1 *cell = (C1 *)self.prototypeCell;
    cell.firstlabel.text = [_dataArray objectAtIndex:indexPath.row];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"h=%f", size.height + 1);
    return 1  + size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
