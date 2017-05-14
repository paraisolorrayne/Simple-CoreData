//
//  ViewController.m
//  CoreData
//
//  Created by Zup Beta on 12/05/17.
//  Copyright © 2017 DevTech. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TaskPropertyObject.h"
#import "TaskMO.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameActivityTxtField;
@property (strong, nonatomic) IBOutlet UITextField *categoryActivityTxtField;
@property (strong, nonatomic) IBOutlet UITextField *desciptionActivityTxtField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Action

- (IBAction)saveData:(id)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
