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
@property (weak) IBOutlet NSTableView *teamMembersTableView;
@property (weak) IBOutlet NSTextField *teamMembernameTextField;
@property (weak) IBOutlet NSTextField *teamMemberPositionTextField;

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


-(TeamMeberDoc*)selectedTeamMemberDoc
{
    NSInteger selectedRow = [self.teamMembersTableView selectedRow];
    if (selectedRow >=0 && self.members.count > selectedRow) {
        TeamMeberDoc *member = [self.members objectAtIndex:selectedRow];
        return member;
    }
    return nil;
}

-(void)setDetailInfo:(TeamMeberDoc*)doc{
    NSString *name = @"";
    float position=0;
    if (doc != nil){
        name = doc.data.name;
        position = doc.data.position;
    }
    [self.teamMembernameTextField setStringValue:name];
    [self.teamMemberPositionTextField setStringValue: [[NSNumber numberWithFloat:position] stringValue]];
}

-(void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    TeamMeberDoc *selectedDoc = [self selectedTeamMemberDoc];
    // Update info
    [self setDetailInfo:selectedDoc];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.members count];
}
- (IBAction)teamMemberNameDidEndEdit:(id)sender {
    TeamMeberDoc *selectedDoc = [self selectedTeamMemberDoc];
    if (selectedDoc){
        selectedDoc.data.name = [self.teamMembernameTextField stringValue];
        
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:[self.members     indexOfObject:selectedDoc]];
        NSIndexSet * columnSet = [NSIndexSet indexSetWithIndex:0];
        [self.teamMembersTableView reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
    }
}
- (IBAction)teamMemberPositionDidEndEdit:(id)sender {
    TeamMeberDoc *selectedDoc = [self selectedTeamMemberDoc];
    if (selectedDoc){
        selectedDoc.data.position = [self.teamMemberPositionTextField floatValue];
        
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:[self.members     indexOfObject:selectedDoc]];
        NSIndexSet * columnSet = [NSIndexSet indexSetWithIndex:0];
        [self.teamMembersTableView reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
    }
}

- (IBAction)addMember:(id)sender {
    TeamMeberDoc *newDoc = [[TeamMeberDoc alloc] initWithName:@"New Team Member" position:0];
    
    [self.members addObject:newDoc];
    NSInteger newRowIndex = self.members.count-1;
    
    [self.teamMembersTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] withAnimation:NSTableViewAnimationEffectGap];
    
    [self.teamMembersTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO ];
    [self.teamMembersTableView scrollRowToVisible:newRowIndex];
    
}

- (IBAction)removeMember:(id)sender {
    TeamMeberDoc *selectedDoc = [self selectedTeamMemberDoc];
    if(selectedDoc){
        [self.members removeObject:selectedDoc];
        [self.teamMembersTableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.teamMembersTableView.selectedRow] withAnimation:NSTableViewAnimationSlideRight];
        [self setDetailInfo:nil];
    }
}

@end
