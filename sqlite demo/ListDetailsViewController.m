//
//  ListDetailsViewController.m
//  sqlite demo
//
//  Created by Bhagyashri Pachpande on 07/03/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import "ListDetailsViewController.h"

@interface ListDetailsViewController ()

@end

@implementation ListDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _txtName.text=[_DictName valueForKey:@"name"];
    _txtCity.text=[_DictName valueForKey:@"city"];
    _txtAddress.text=[_DictName valueForKey:@"address"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BtnActionSave:(id)sender {
    NSString *strQuery=[NSString stringWithFormat:@"update personDetails set name = '%@', address = '%@', city = '%@' where id = %@ ",_txtName.text,_txtAddress.text,_txtCity.text,[_DictName valueForKey:@"id"]];
    [DBManager manupulationsIntoDatabase:strQuery];
}
@end
