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
@synthesize pictureListArray;
@synthesize songTableView;
@synthesize myPlaylistQuery;
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
        
        
        //[cell.imageSong setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"shelf"]]];
        
        //set content left side
        
//        [cell.titleSong setFont:"font_RSU_Regular15"];
    }
//    MPMediaQuery *myPlaylistQuery = [[MPMediaQuery alloc]init];
//    NSArray *itemSong = [myPlaylistQuery items];
//    
//    
//	UIImage *artworkImage = [UIImage imageNamed:@"noArtworkImage.png"];
//	MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
//	
//	if (artwork) {
//		artworkImage = [artwork imageWithSize: CGSizeMake (320, 94)];
//	}
//	
//    [artworkImageView setImage:artworkImage];
    
    [cell.imageSong setImage:[pictureListArray objectAtIndex:indexPath.row]];
//    [cell.imageSong setBackgroundColor:[UIColor blackColor]];
    [cell.titleSong setText:[songListArray objectAtIndex:indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

#pragma delegate TableView

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayerViewController *play = [[PlayerViewController alloc]initWithNibName:@"PlayerViewController" bundle:nil];
    [play setCurrentIndex:indexPath.row];
    [play setMyPlaylistQuery:myPlaylistQuery];
    [self.navigationController pushViewController:play animated:YES];
}



@end
