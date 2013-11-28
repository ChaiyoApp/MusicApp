//
//  ViewController.h
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "SongViewController.h"
@interface ViewController : UIViewController<MPMediaPickerControllerDelegate>
{
    MPMediaQuery *myPlaylistQuery;
    MPMusicPlayerController *musicPlayer;
}
@property (nonatomic,strong) NSArray *musicArray;
@property (nonatomic,strong) NSArray *pictureArray;
@property (retain, nonatomic) IBOutlet UILabel *Count_Song;


@end
