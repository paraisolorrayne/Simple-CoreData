//
//  TaskPropertyObject.h
//  CoreData
//
//  Created by Zup Beta on 12/05/17.
//  Copyright © 2017 DevTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskPropertyObject : NSObject
@property (strong, nonatomic) NSString *activityName;
@property (strong, nonatomic) NSString *activityDescription;
@property (strong, nonatomic) NSString *activityCategory;
- (instancetype)initWithData;
@end
