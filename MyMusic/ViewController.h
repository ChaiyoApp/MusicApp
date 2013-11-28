//
//  ViewController.h
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController<MPMediaPickerControllerDelegate>

@property (nonatomic,strong) NSArray *musicArray;
@property (retain, nonatomic) IBOutlet UILabel *Count_Song;

@end
