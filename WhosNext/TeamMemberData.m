//
//  TeamMemberData.m
//  WhosNext
//
//  Created by Joel on 8/27/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import "TeamMemberData.h"

@implementation TeamMemberData

- (id)initWithName:(NSString *)name position:(float)position {
    if ((self = [super init])){
        self.name = name;
        self.position = position;
    }
    return self;
}
@end
