//
//  ListViewController.h
//  sqlite demo
//
//  Created by Bhagyashri Pachpande on 07/03/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailsViewController.h"
#import "DBManager.h"

@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arrPersonDetails;
}

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end
