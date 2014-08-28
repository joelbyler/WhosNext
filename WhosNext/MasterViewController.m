//
//  MasterViewController.m
//  WhosNext
//
//  Created by Joel on 8/27/14.
//  Copyright (c) 2014 LeanDog. All rights reserved.
//

#import "MasterViewController.h"
#import "TeamMeberDoc.h"
#import "TeamMemberData.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    // Get a new ViewCell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
    if( [tableColumn.identifier isEqualToString:@"MemberColumn"] )
    {
        TeamMeberDoc *memberDoc = [self.members objectAtIndex:row];
        cellView.textField.stringValue = memberDoc.data.name;
        return cellView;
    }
    return cellView;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.members count];
}

@end
