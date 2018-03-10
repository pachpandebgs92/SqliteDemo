//
//  ViewController.m
//  sqlite demo
//
//  Created by Student P_07 on 25/02/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)BtnAdd:(id)sender {
    NSString *strQuery= [NSString stringWithFormat:@"Insert into personDetails (name , address , city) values (\"%@\", \"%@\", \"%@\")",_txtName.text,_txtAddress.text,_txtCity.text];
    [DBManager manupulationsIntoDatabase:strQuery];
}

- (IBAction)BtnList:(id)sender {
    ListViewController *listVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    [self.navigationController pushViewController:listVC animated:YES];
}

- (IBAction)BtnSearch:(id)sender {
    SearchViewController *searchVC=[self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:searchVC animated:YES];
}
@end
