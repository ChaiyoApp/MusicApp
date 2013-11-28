//
//  SongViewController.m
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import "SongViewController.h"
#import "SongCell.h"

@interface SongViewController ()

@end

@implementation SongViewController
@synthesize songListArray;
@synthesize songTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma datasource TableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [songListArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"AAA";
    SongCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        // From Nib
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SongCell_iPhone" owner:self options:nil];
    	cell = (SongCell *)[nib objectAtIndex:0];
        MPMediaItemCollection *itemCollection;
        
        //[cell.imageSong setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"shelf"]]];
        
        //set content left side
        //[cell.titleSong setText:[songListArray objectAtIndex:indexPath.row]];
        //[cell.titleSong setFont:font_RSU_Regular15];
    }
    
    return cell;
}


#pragma delegate TableView
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}




@end
