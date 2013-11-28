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

- (void)viewDidAppear:(BOOL)animated
{
    musicArray = [self getMusic];
    Count_Song.text = [NSString stringWithFormat:@"Music = %d Songs",[musicArray count]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"My First App");
    NSLog(@"boso");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSArray *)getMusic
{
    MPMediaQuery *myPlaylistQuery = [[MPMediaQuery alloc]init];
//    MPMediaPropertyPredicate *playListNamePredicate =
//    [MPMediaPropertyPredicate predicateWithValue: @"THAI" forProperty: MPMediaPlaylistPropertyName];
//    [myPlaylistQuery addFilterPredicate:playListNamePredicate];
    
    NSArray *itemSong = [myPlaylistQuery items];
    NSLog(@"song total = %d",[itemSong count]);
//    int i = 1;
//    for (MPMediaItemCollection *song in itemSong) {
//        NSString *songname = [song valueForProperty:MPMediaItemPropertyTitle];
//        NSLog(@"songname %d = %@",i,songname);
//        i++;
//    }
    return itemSong;
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
