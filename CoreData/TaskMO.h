//
//  TaskMO.h
//  CoreData
//
//  Created by Zup Beta on 12/05/17.
//  Copyright © 2017 DevTech. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface TaskMO : NSManagedObject
@property (weak, nonatomic) NSString *activityName;
@property (weak, nonatomic) NSString *activityDescription;
@property (weak, nonatomic) NSString *activityCategory;
@end
