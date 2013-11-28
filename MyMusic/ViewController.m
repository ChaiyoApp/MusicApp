//
//  ViewController.m
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize musicArray;
@synthesize Count_Song;
@synthesize pictureArray;
- (void)viewDidAppear:(BOOL)animated
{
    [self getMusic];
    Count_Song.text = [NSString stringWithFormat:@"Music = %d Songs",[musicArray count]];
    SongViewController *song = [[SongViewController alloc]initWithNibName:@"SongViewController" bundle:nil];
    [song setSongListArray:musicArray];
    [song setPictureListArray:pictureArray];
    [song setMyPlaylistQuery:myPlaylistQuery];
    [self.navigationController pushViewController:song animated:YES];
//    [self presentViewController:song animated:YES completion:nil];
}
- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)getMusic
{
    myPlaylistQuery = [[MPMediaQuery alloc]init];
//    MPMediaPropertyPredicate *playListNamePredicate =
//    [MPMediaPropertyPredicate predicateWithValue: @"THAI" forProperty: MPMediaPlaylistPropertyName];
//    [myPlaylistQuery addFilterPredicate:playListNamePredicate];
    
    NSArray *itemSong = [myPlaylistQuery items];
    NSLog(@"song total = %d",[itemSong count]);
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSMutableArray *picArr = [[NSMutableArray alloc]initWithCapacity:300];
//    int i = 0;
    for (MPMediaItemCollection *song in itemSong) {
        NSString *songname = [song valueForProperty:MPMediaItemPropertyTitle];
//        NSLog(@"songname%d = , %@",i,songname);
        MPMediaItemArtwork *artwork = [song valueForProperty:MPMediaItemPropertyArtwork];
        UIImage *artworkImage = [UIImage imageNamed:@""];
//        artworkImage set
        if (artwork) {
        	artworkImage = [artwork imageWithSize: CGSizeMake (320, 94)];
        }
        if (artworkImage == NULL) {
            artworkImage = [UIImage imageNamed:@"noArtworkImage"];
        }
        [arr addObject:songname];
        [picArr addObject:artworkImage];
//        i++;
    }
    musicArray = [arr mutableCopy];
    pictureArray = [picArr mutableCopy];
//    [musicPlayer setShuffleMode:MPMusicShuffleModeOff];
//    [musicPlayer setRepeatMode:MPMusicRepeatModeOne];
//    [musicPlayer setQueueWithQuery: myPlaylistQuery];
//    [musicPlayer play];
}
- (void)dealloc {
    [Count_Song release];
    [super dealloc];
}
@end
