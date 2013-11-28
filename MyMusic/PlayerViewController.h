//
//  PlayerViewController.h
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface PlayerViewController : UIViewController<MPMediaPickerControllerDelegate>
{
    MPMusicPlayerController *musicPlayer;
}
@property (nonatomic,strong) NSArray *songListArray;
@property NSInteger currentIndex;

@property (retain, nonatomic) IBOutlet UIButton *previousButton;
@property (retain, nonatomic) IBOutlet UIButton *playPauseButton;
@property (retain, nonatomic) IBOutlet UIButton *nextButton;
@property (retain, nonatomic) IBOutlet UIButton *shuffleButton;
@property (retain, nonatomic) IBOutlet UIButton *repeatButton;
@property (retain, nonatomic) IBOutlet UISlider *sliderTime;

- (IBAction)endSliding:(id)sender;
- (IBAction)beginSliding:(id)sender;

- (IBAction)sliderTime:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)previous:(id)sender;
- (IBAction)shuffle:(id)sender;
- (IBAction)repeat:(id)sender;
@end
