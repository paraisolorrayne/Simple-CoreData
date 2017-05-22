//
//  TableViewController.h
//  CoreData
//
//  Created by Zup Beta on 22/05/17.
//  Copyright © 2017 DevTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskMO.h"

@interface TableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray <TaskMO *> *tasks;
@end
