//
//  TeamMeberDoc.m
//  WhosNext
//
//  Created by Joel on 8/27/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import "TeamMeberDoc.h"
#import "TeamMemberData.h"

@implementation TeamMeberDoc

-(id)initWithName:(NSString *)name position:(float)position {
    if ((self = [super init])){
        self.data = [[TeamMemberData alloc] initWithName:name position:position];
    }
    return self;
}

@end
