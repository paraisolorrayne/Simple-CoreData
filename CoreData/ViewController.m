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

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameActivityTxtField;
@property (strong, nonatomic) IBOutlet UITextField *categoryActivityTxtField;
@property (strong, nonatomic) IBOutlet UITextField *desciptionActivityTxtField;
@property (strong, nonatomic) TaskPropertyObject *taskObj;
@property (strong, nonatomic) TaskMO *taskMO;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taskObj = [[TaskPropertyObject alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)enterActivity {
   // [_taskObj setActivityName:_nameActivityTxtField.text];
    _taskObj.activityName = _nameActivityTxtField.text;
    [_nameActivityTxtField resignFirstResponder];
//    [_taskObj setActivityCategory:_categoryActivityTxtField.text];
//    _taskObj.activityCategory = _categoryActivityTxtField.text;
//    [_categoryActivityTxtField resignFirstResponder];
//    [_taskObj setActivityDescription:_desciptionActivityTxtField.text];
//    [_desciptionActivityTxtField resignFirstResponder];
}

-(void)transferObject {
    [self enterActivity];
   // self.taskMO.activityName = _taskObj.activityName;
    NSLog(@"%@", _taskMO.activityName);
    //[_taskMO setActivityName:_taskObj.activityName];
    NSLog(@"%@", _taskMO.activityName);
    [_taskMO setValue:_taskObj.activityName forKey:@"Name"];
    NSLog(@"%@", _taskMO.activityName);
    //[_taskMO setActivityCategory:_taskObj.activityCategory];
    //[_taskMO setActivityDescription:_taskObj.activityDescription];
}

-(void)saveActivityInCoreData {
    AppDelegate *appDelegate = (AppDelegate *) UIApplication.sharedApplication.delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    _taskMO = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    [self transferObject];
    NSLog(@"%@\n%@\n%@\n", _taskMO.activityName, _taskMO.activityCategory, _taskMO.activityDescription);
}




#pragma mark - Action

- (IBAction)saveData:(id)sender {
    [self saveActivityInCoreData];
    UIAlertController *view = [UIAlertController
                               alertControllerWithTitle:@"Atividade salva!"
                               message:@""
                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Ok"
                         style:UIAlertActionStyleCancel
                         handler:^(UIAlertAction *action) {
                             [view dismissViewControllerAnimated:YES completion:^{
                             }];
                         }];
    [view addAction:ok];
    [self presentViewController:view animated:YES completion:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
