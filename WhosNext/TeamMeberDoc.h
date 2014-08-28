//
//  TeamMeberDoc.h
//  WhosNext
//
//  Created by Joel on 8/27/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TeamMemberData;

@interface TeamMeberDoc : NSObject

@property (strong) TeamMemberData *data;
// more info about a team member

- (id)initWithName:(NSString*)name position:(float)position;

@end
