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

#warning разобрать тут!
-(NSInteger)setRandomValue{
    self.randomValue = arc4random_uniform(10);
    NSLog(@"RANDOM VALUE IS %ld", (long)self.randomValue);
    return self.randomValue;
}

-(void)setEasyBotByTimer:(UISlider *) slider{
    [UIView animateWithDuration:arc4random_uniform(10) + arc4random_uniform(10) animations:^{
        [slider setValue:slider.maximumValue - 0.0001 animated:YES];
        NSLog(@"slider animations work");
    }];
    [self performSelector:@selector(setEasyBotSliderMaxValue:)
               withObject:slider
               afterDelay:[self setRandomValue]];
}

-(void)setEasyBotSliderMaxValue:(UISlider *) maxSlider{
    
    maxSlider.value = maxSlider.maximumValue;
    NSLog(@"max value work and max value is %f", maxSlider.maximumValue);
}

-(void)couintingOfText{
    
}

@end
