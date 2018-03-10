//
//  SearchViewController.h
//  sqlite demo
//
//  Created by Bhagyashri Pachpande on 07/03/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface SearchViewController : UIViewController
{
    NSArray *arrPersonData;
}

@property (weak, nonatomic) IBOutlet UITextField *txtSearch;
- (IBAction)btnActionSearch:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;

@end
