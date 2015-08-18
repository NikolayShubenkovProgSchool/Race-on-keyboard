//
//  BotView.m
//  Race on keyboard
//
//  Created by Semen on 17.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "BotView.h"
#import "YouWinViewController.h"

@interface BotView ()

@property (assign, nonatomic) NSInteger randomValue;

@end

@implementation BotView

// задаем время ботам
-(NSInteger)setRandomValue{
    self.randomValue = 25 + arc4random_uniform(25);
    NSLog(@"RANDOM VALUE IS %ld", (long)self.randomValue);
    return self.randomValue;
}

//анимация слайдера
-(void)setEasyBotByTimer:(UISlider *) slider{
    NSInteger i = [self setRandomValue];
    [UIView animateWithDuration:i animations:^{
        [slider setValue:slider.maximumValue - 0.0001 animated:YES];
        NSLog(@"slider animations work");
    }];
    [self performSelector:@selector(setEasyBotSliderMaxValue:)
               withObject:slider
               afterDelay:i];
}

-(void)setEasyBotSliderMaxValue:(UISlider *) maxSlider{
    
    maxSlider.value = maxSlider.maximumValue;
    NSLog(@"max value work and max value is %f", maxSlider.maximumValue);
}

-(void)couintingOfText{
    
}

@end
