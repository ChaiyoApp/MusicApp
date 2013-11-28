//
//  PlayerViewController.m
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController
@synthesize previousButton,playPauseButton,nextButton,shuffleButton,repeatButton;  //UIButton
@synthesize sliderTime; //UISlider
@synthesize songListArray; //NSArray
@synthesize currentIndex; //NSInteger
@synthesize artworkImageView;
@synthesize titleName,albumName,artistName,currentTime,endTime;
@synthesize myPlaylistQuery;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
    MPMediaItem *nowSong = myPlaylistQuery.items[currentIndex];
    [musicPlayer setQueueWithQuery:myPlaylistQuery];
    [musicPlayer setNowPlayingItem:nowSong];
    [musicPlayer setShuffleMode:MPMusicShuffleModeOff];
    [musicPlayer setRepeatMode:MPMusicRepeatModeOne];
//    NSTimeInterval currentTime = [[MPMusicPlayerController iPodMusicPlayer] currentPlaybackTime];
    
//    int durationInt = [duration intValue];
    [musicPlayer play];
    [self registerMediaPlayerNotifications];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self changeDurationSong];
}
-(void)changeDurationSong
{
    NSNumber *duration = [[MPMusicPlayerController iPodMusicPlayer].nowPlayingItem valueForProperty:MPMediaItemPropertyPlaybackDuration];
    float durationFloat = [duration floatValue] ;
    int durationInt = (int)durationFloat ;
    self.endTime.text = [NSString stringWithFormat:@"%02d : %02d",(durationInt/60)%60, durationInt%60];
}
#pragma View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [sliderTime setMaximumTrackTintColor:[UIColor clearColor]];
    [sliderTime setMinimumTrackTintColor:[UIColor redColor]];
    MPMediaItem *nowSong = myPlaylistQuery.items[currentIndex];
    titleName.text = [nowSong valueForKey:MPMediaItemPropertyTitle];
    albumName.text = [nowSong valueForKey:MPMediaItemPropertyAlbumTitle];
    artistName.text = [nowSong valueForKey:MPMediaItemPropertyArtist];
    MPMediaItemArtwork *artwork = [nowSong valueForProperty: MPMediaItemPropertyArtwork];
	UIImage *artworkImage = [UIImage imageNamed:@""];
	if (artwork) {
		artworkImage = [artwork imageWithSize: CGSizeMake (320, 180)];
	}
	if (artworkImage == NULL) {
        artworkImage = [UIImage imageNamed:@"noArtworkImage"];
    }
    [artworkImageView setImage:artworkImage];

    // Do any additional setup after loading the view from its nib.
}
- (void) registerMediaPlayerNotifications
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
	[notificationCenter addObserver: self
						   selector: @selector (handle_NowPlayingItemChanged:)
							   name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification
							 object: musicPlayer];
	
	[notificationCenter addObserver: self
						   selector: @selector (handle_PlaybackStateChanged:)
							   name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
							 object: musicPlayer];
    
    [notificationCenter addObserver: self
						   selector: @selector (handle_VolumeChanged:)
							   name: MPMusicPlayerControllerVolumeDidChangeNotification
							 object: musicPlayer];
    
	[musicPlayer beginGeneratingPlaybackNotifications];
}


- (void) handle_NowPlayingItemChanged: (id) notification
{
    NSLog(@"handle");
   	MPMediaItem *currentItem = [musicPlayer nowPlayingItem];
	UIImage *artworkImage = [UIImage imageNamed:@""];
	MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
	
	if (artwork) {
		artworkImage = [artwork imageWithSize: CGSizeMake (320, 180)];
	}
	if (artworkImage == NULL) {
        artworkImage = [UIImage imageNamed:@"noArtworkImage"];
    }
    [artworkImageView setImage:artworkImage];
    
    NSString *titleString = [currentItem valueForProperty:MPMediaItemPropertyTitle];
    if (titleString) {
        titleName.text = titleString;
    } else {
        titleName.text = @"Unknown title";
    }
    
    NSString *artistString = [currentItem valueForProperty:MPMediaItemPropertyArtist];
    if (artistString) {
        artistName.text = artistString;
    } else {
        artistName.text = @"Unknown artist";
    }
    
    NSString *albumString = [currentItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    if (albumString) {
        albumName.text = albumString;
    } else {
        albumName.text = @"Unknown album";
    }
    [self changeDurationSong];
//    long
    
}


- (void) handle_PlaybackStateChanged: (id) notification
{
    MPMusicPlaybackState playbackState = [musicPlayer playbackState];
	
	if (playbackState == MPMusicPlaybackStatePaused) {
        [playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
        
        
	} else if (playbackState == MPMusicPlaybackStatePlaying) {
        [playPauseButton setImage:[UIImage imageNamed:@"pauseButton.png"] forState:UIControlStateNormal];
        
	} else if (playbackState == MPMusicPlaybackStateStopped) {
        
        [playPauseButton setImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
		[musicPlayer stop];
        
	}
    
}


- (void) handle_VolumeChanged: (id) notification
{
//    [volumeSlider setValue:[musicPlayer volume]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [previousButton release];
    [nextButton release];
    [shuffleButton release];
    [repeatButton release];
    [playPauseButton release];
    [sliderTime release];
    [super dealloc];
}

#pragma SliderTime
- (IBAction)endSliding:(id)sender {
    
}

- (IBAction)beginSliding:(id)sender {
    
}

- (IBAction)sliderTime:(id)sender {
    
}
#pragma Button Action
- (IBAction)next:(id)sender {
    [musicPlayer skipToNextItem];
}

- (IBAction)playPause:(id)sender {
    [musicPlayer play];
}

- (IBAction)previous:(id)sender {
    [musicPlayer skipToPreviousItem];
}

- (IBAction)shuffle:(id)sender {
    [musicPlayer setShuffleMode:MPMusicShuffleModeOff];
    [musicPlayer setShuffleMode:MPMusicShuffleModeSongs];
}

- (IBAction)repeat:(id)sender {
    [musicPlayer setRepeatMode:MPMusicRepeatModeAll];
    [musicPlayer setRepeatMode:MPMusicRepeatModeNone];
    [musicPlayer setRepeatMode:MPMusicRepeatModeOne];
}
@end
