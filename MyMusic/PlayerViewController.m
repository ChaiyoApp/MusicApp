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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma View Life Cycle
- (void)viewDidLoad
{
    [sliderTime setMaximumTrackTintColor:[UIColor clearColor]];
    [sliderTime setMinimumTrackTintColor:[UIColor redColor]];
    //    [mScrubber setThumbTintColor:[UIColor grayColor]];
//    [sliderTime setThumbImage:[UIImage imageNamed:@"thumbVideo"] forState:UIControlStateNormal];
//    [sliderTime setThumbImage:[UIImage imageNamed:@"thumbVideoHighlighted"] forState:UIControlStateHighlighted];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
