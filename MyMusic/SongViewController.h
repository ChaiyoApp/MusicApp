//
//  SongViewController.h
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface SongViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic,strong) NSArray *songListArray;
@property (nonatomic,strong) UITableView *songTableView;

@end
