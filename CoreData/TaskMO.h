//
//  TaskMO.h
//  CoreData
//
//  Created by Zup Beta on 12/05/17.
//  Copyright © 2017 DevTech. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface TaskMO : NSManagedObject
@property (strong, nonatomic) NSString *activityName;
@property (strong, nonatomic) NSString *activityDescription;
@property (strong, nonatomic) NSString *activityCategory;
@end
