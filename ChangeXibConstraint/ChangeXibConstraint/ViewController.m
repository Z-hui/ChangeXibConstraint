//
//  ViewController.m
//  ChangeXibConstraint
//
//  Created by HSEDU on 17/4/17.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

#import "ViewController.h"
#import "ChangeWidthConstTableViewCell.h"
#import "ChangeRightMarginTableViewCell.h"
#import "ChangeWidthMultiplierTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ChangeWidthConstTableViewCellDelegate,ChangeWidthMultiplierTableViewCellDelegate,ChangeRightMarginTableViewCellDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *initialList;//初始值
@property(nonatomic,strong) NSMutableArray *Changelist;//存储改变
@end

@implementation ViewController
-(NSArray *)initialList
{
    if (_initialList == nil) {
        _initialList = @[@"20.0",@"90.0",@"0.3"];
    }
    return _initialList;
}
-(NSMutableArray *)Changelist
{
    if (_Changelist == nil) {
        _Changelist = [NSMutableArray arrayWithObjects:@"20.0",@"90.0",@"0.3", nil];
    }
    
    return _Changelist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Xib约束代码修改Demo";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:(UIBarButtonItemStylePlain) target:self action:@selector(reload)];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStylePlain)];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self registerCell];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)registerCell{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ChangeWidthConstTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ChangeWidthConstTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ChangeRightMarginTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ChangeRightMarginTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ChangeWidthMultiplierTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ChangeWidthMultiplierTableViewCell"];

}
-(void)reload{
    [self.Changelist removeAllObjects];
    [self.Changelist addObjectsFromArray:self.initialList];
    [self.tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ChangeRightMarginTableViewCell *rightMarginCell = [tableView dequeueReusableCellWithIdentifier:@"ChangeRightMarginTableViewCell"];
        rightMarginCell.rightMarginConstraint.constant = [self.Changelist[indexPath.section] floatValue];
        rightMarginCell.indexPath = indexPath;
        rightMarginCell.delegate = self;
        return rightMarginCell;
    }
    else if (indexPath.section == 1)
    {
        ChangeWidthConstTableViewCell *widthConstCell = [tableView dequeueReusableCellWithIdentifier:@"ChangeWidthConstTableViewCell"];
          widthConstCell.buttonWidthConstraint.constant = [self.Changelist[indexPath.section] floatValue];
          widthConstCell.indexPath = indexPath;
          widthConstCell.delegate = self;
        return widthConstCell;
    }
    else
    {
        ChangeWidthMultiplierTableViewCell *widthMultiplierCell = [tableView dequeueReusableCellWithIdentifier:@"ChangeWidthMultiplierTableViewCell"];
        widthMultiplierCell.multiplierValue = [self.Changelist[indexPath.section] floatValue];
        widthMultiplierCell.indexPath = indexPath;
        widthMultiplierCell.delegate = self;
        return widthMultiplierCell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(void)ChangeWidthConstTableViewCellChangeAction:(NSIndexPath *)indexPath Value:(NSString *)value{
    [self.Changelist replaceObjectAtIndex:indexPath.section withObject:value];
    [self.tableView reloadData];
}
-(void)ChangeWidthMultiplierTableViewCellChangeAction:(NSIndexPath *)indexPath Value:(NSString *)value
{
     [self.Changelist replaceObjectAtIndex:indexPath.section withObject:value];
     [self.tableView reloadData];
}
-(void)ChangeRightMarginTableViewCellChangeAction:(NSIndexPath *)indexPath Value:(NSString *)value
{
     [self.Changelist replaceObjectAtIndex:indexPath.section withObject:value];
     [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
