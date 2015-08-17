//
//  BotView.m
//  Race on keyboard
//
//  Created by Semen on 17.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "BotView.h"
#import "YouWinYouLoseViewController.h"

@implementation BotView

-(void)setEasyBotByTimer:(UISlider *) slider{
    [UIView animateWithDuration:arc4random_uniform(10) + arc4random_uniform(10) animations:^{
        [slider setValue:slider.maximumValue animated:YES];
    }];
    
}

@end
