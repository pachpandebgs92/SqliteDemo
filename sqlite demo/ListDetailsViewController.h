//
//  ListDetailsViewController.h
//  sqlite demo
//
//  Created by Bhagyashri Pachpande on 07/03/18.
//  Copyright © 2018 bgs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ListDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong,nonatomic) NSDictionary *DictName;
- (IBAction)BtnActionSave:(id)sender;

@end
