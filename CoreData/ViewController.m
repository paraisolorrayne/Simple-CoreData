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
#import "TableViewController.h"

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
    self.nameActivityTxtField.delegate = self;
    self.nameActivityTxtField.returnKeyType = UIReturnKeyNext;
    self.categoryActivityTxtField.delegate = self;
    self.desciptionActivityTxtField.delegate = self;
    self.taskObj = [[TaskPropertyObject alloc]init];
}

-(void)enterActivity {
    _taskObj.activityName = _nameActivityTxtField.text;
    _taskMO.activityName = _taskObj.activityName;
    NSLog(@"%@", _taskMO.activityName);
    _taskMO.activityName = _nameActivityTxtField.text;
    NSLog(@"%@", _taskMO.activityName);
    _taskObj.activityCategory = _categoryActivityTxtField.text;
    _taskObj.activityDescription = _desciptionActivityTxtField.text;
}

-(void)transferObject {
    [self enterActivity];
    NSLog(@"%@", _taskMO);
    NSLog(@"%@", _taskMO.activityName);
    _taskMO.activityName = _taskObj.activityName;
    NSLog(@"%@", _taskMO.activityName);
    [_taskMO setActivityName:_taskObj.activityName];
    NSLog(@"%@", _taskMO.activityName);
    [_taskMO setValue:_taskObj.activityName forKey:@"Name"];
    NSLog(@"%@", _taskMO.activityName);
}

-(void)saveActivityInCoreData {
    [self enterActivity];
    AppDelegate *appDelegate = (AppDelegate *) UIApplication.sharedApplication.delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    self.taskMO = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    NSError *error = nil;
    [context save:&error];
    if (error) {
        NSLog(@"%@", error);
    }
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
                                 
                                 TableViewController *table = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Table"];
                                 [self.navigationController pushViewController:table animated:YES];
                                 
                             }];
                         }];
    [view addAction:ok];
    [self presentViewController:view animated:YES completion:nil];
}

- (IBAction)dismissKeyboard:(UITapGestureRecognizer *)sender {
    [_nameActivityTxtField resignFirstResponder];
    [_categoryActivityTxtField resignFirstResponder];
    [_desciptionActivityTxtField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.nameActivityTxtField || theTextField == self.categoryActivityTxtField || theTextField == self.desciptionActivityTxtField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
