//
//  ListViewController.m
//  sqlite demo
//
//  Created by Bhagyashri Pachpande on 07/03/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)viewWillAppear:(BOOL)animated{
    _listTableView.dataSource=self;
    _listTableView.delegate=self;
    arrPersonDetails=[DBManager fetchRecordFromDatabase:@"select * from personDetails"];
    NSLog(@"%@",arrPersonDetails);
    [_listTableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrPersonDetails.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor=[UIColor lightGrayColor];
    cell.textLabel.text=[[arrPersonDetails objectAtIndex:indexPath.row] valueForKey:@"name"];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *arrtemp = [[NSMutableArray alloc]init];
    arrtemp = [arrPersonDetails mutableCopy];
    NSString *strQuery = [NSString stringWithFormat:@"delete from personDetails where id = %@",[[arrPersonDetails objectAtIndex:indexPath.row] valueForKey:@"id"]];
    if ([DBManager manupulationsIntoDatabase:strQuery]) {
        [arrtemp removeObjectAtIndex:indexPath.row];
        arrPersonDetails = [arrtemp copy];
        [_listTableView reloadData];
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListDetailsViewController *listDetailsVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ListDetailsViewController"];
    listDetailsVC.DictName=[arrPersonDetails objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:listDetailsVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
