//
//  TaskPropertyObject.m
//  CoreData
//
//  Created by Zup Beta on 12/05/17.
//  Copyright © 2017 DevTech. All rights reserved.
//

#import "TaskPropertyObject.h"

@implementation TaskPropertyObject
- (instancetype)initWithData:(NSDictionary *)jsonDataObject {
    self = [super init];
    
    if (self) {
        _activityName = jsonDataObject[@"Name"];
        _activityCategory = jsonDataObject[@"Category"];
        _activityDescription = jsonDataObject [@"Description"];
        
    }
    
    return self;
}
@end
