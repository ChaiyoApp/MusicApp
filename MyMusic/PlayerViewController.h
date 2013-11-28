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
@property (nonatomic,strong) MPMediaQuery *myPlaylistQuery;
@property (retain, nonatomic) IBOutlet UIImageView *artworkImageView;

@property (retain, nonatomic) IBOutlet UIButton *previousButton;
@property (retain, nonatomic) IBOutlet UIButton *playPauseButton;
@property (retain, nonatomic) IBOutlet UIButton *nextButton;
@property (retain, nonatomic) IBOutlet UIButton *shuffleButton;
@property (retain, nonatomic) IBOutlet UIButton *repeatButton;
@property (retain, nonatomic) IBOutlet UISlider *sliderTime;
@property (retain, nonatomic) IBOutlet UILabel *titleName;
@property (retain, nonatomic) IBOutlet UILabel *albumName;
@property (retain, nonatomic) IBOutlet UILabel *artistName;
@property (retain, nonatomic) IBOutlet UILabel *currentTime;
@property (retain, nonatomic) IBOutlet UILabel *endTime;

- (IBAction)endSliding:(id)sender;
- (IBAction)beginSliding:(id)sender;

- (IBAction)sliderTime:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)previous:(id)sender;
- (IBAction)shuffle:(id)sender;
- (IBAction)repeat:(id)sender;
@end
