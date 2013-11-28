//
//  SongViewController.h
//  MyMusic
//
//  Created by benznaja on 9/13/56 BE.
//  Copyright (c) 2556 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PlayerViewController.h"
@interface SongViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>
{
    
}
@property (nonatomic,strong) MPMediaQuery *myPlaylistQuery;
@property (nonatomic,strong) NSArray *songListArray;
@property (nonatomic,strong) NSArray *pictureListArray;
@property (nonatomic,strong) UITableView *songTableView;

@end
