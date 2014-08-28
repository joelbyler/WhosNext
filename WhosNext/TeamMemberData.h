//
//  TeamMemberData.h
//  WhosNext
//
//  Created by Joel on 8/27/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamMemberData : NSObject

@property (strong) NSString *name;
@property (assign) float position;

- (id)initWithName:(NSString*)name position:(float)position;

@end
