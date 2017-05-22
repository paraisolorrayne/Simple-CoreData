//
//  TaskPropertyObject.m
//  CoreData
//
//  Created by Zup Beta on 12/05/17.
//  Copyright © 2017 DevTech. All rights reserved.
//

#import "TaskPropertyObject.h"

@implementation TaskPropertyObject
- (instancetype)initWithData {
    self = [super init];
    
    if (self) {
        _activityName = @"Name";
        _activityCategory = @"Category";
        _activityDescription =  @"Description";
    }
    
    return self;
}
@end
