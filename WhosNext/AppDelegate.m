//
//  AppDelegate.m
//  WhosNext
//
//  Created by Joel on 8/27/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import "AppDelegate.h"

#include "MasterViewController.h"

#import "TeamMeberDoc.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    // 1. Create the master View Controller
    self.masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    
    // 2. Some sample data so we have something to look at
    TeamMeberDoc *joel = [[TeamMeberDoc alloc] initWithName:@"Joel" position:0];
    TeamMeberDoc *steve = [[TeamMeberDoc alloc] initWithName:@"Steve" position:1];
    TeamMeberDoc *carl = [[TeamMeberDoc alloc] initWithName:@"Carl" position:2];
    TeamMeberDoc *gary = [[TeamMeberDoc alloc] initWithName:@"Gary" position:3];
    NSMutableArray *members = [NSMutableArray arrayWithObjects:joel, steve, carl, gary, nil];
    
    self.masterViewController.members = members;
    
    // 3. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.masterViewController.view];
    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
}

@end
