//
//  YouWinYouLoseViewController.m
//  Race on keyboard
//
//  Created by Semen on 17.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "YouWinYouLoseViewController.h"

@interface YouWinYouLoseViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YouWinYouLoseViewController

-(void)youWinGame{
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"win.png"]];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1]];
}

-(void)youGameIsOver{
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gameover"]];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:204/255.0 green:51/255.0 blue:51/255.0 alpha:1]];
}

-(void)setup{
    
}

//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    [super viewDidLoad];
//    [self youWinGame];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self youWinGame];
}


@end
