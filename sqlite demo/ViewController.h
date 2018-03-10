//
//  ViewController.h
//  sqlite demo
//
//  Created by Student P_07 on 25/02/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "SearchViewController.h"
#import "DBManager.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
- (IBAction)BtnAdd:(id)sender;
- (IBAction)BtnList:(id)sender;
- (IBAction)BtnSearch:(id)sender;


@end

