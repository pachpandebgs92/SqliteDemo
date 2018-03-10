//
//  SearchViewController.m
//  sqlite demo
//
//  Created by Bhagyashri Pachpande on 07/03/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrPersonData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor=[UIColor lightGrayColor];
    cell.textLabel.text=[[arrPersonData objectAtIndex:indexPath.row] valueForKey:@"name"];
    return cell;
}

- (IBAction)btnActionSearch:(id)sender {
    NSString *strQuery=[NSString stringWithFormat:@"select * from personDetails where name like '%%%@%%'", _txtSearch.text];
    arrPersonData=
    [DBManager fetchRecordFromDatabase:strQuery];
    [_searchTableView reloadData];
}
@end
