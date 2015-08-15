//
//  CarsColor.m
//  Race on keyboard
//
//  Created by Semen on 15.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "CarsChoiseAndColors.h"

@interface CarsChoiseAndColors ()

@property (assign , nonatomic) NSInteger checkRepeatNumberOfCar;
@property (assign , nonatomic) NSInteger checkRepeatNumberOfCarTwice;
@property (assign, nonatomic) NSInteger checkAboutRepeat;
@property (assign , nonatomic) NSInteger numberOfCar;
@property (nonatomic) UIImageView *imageView;

@end

@implementation CarsChoiseAndColors

-(UIImage *)changeCarsColor:(UISlider *)slider{
    
    self.numberOfCar = arc4random_uniform(10) + 1;
    NSLog(@"random%ld", (long)self.numberOfCar);
    
    if (self.numberOfCar != self.checkRepeatNumberOfCar && self.numberOfCar != self.checkRepeatNumberOfCarTwice) {
        
            UIImage *originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", (long)self.numberOfCar]];
            UIImage *tintedImage = [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            self.imageView = [[UIImageView alloc] initWithImage:tintedImage];
        
            self.imageView.tintColor = [UIColor redColor];
        
        [slider setThumbImage:self.imageView.image forState:UIControlStateNormal];
        
        self.checkRepeatNumberOfCar = self.numberOfCar;
        
        if (self.checkAboutRepeat < 1) {
            self.checkAboutRepeat++;
            self.checkRepeatNumberOfCarTwice = self.numberOfCar;
        }
    }else{
        [self changeCarsColor:slider];
    }
    
//    UIImage *originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", (long)self.numberOfCar]];
//    UIImage *tintedImage = [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:tintedImage];
//    
//    imageView.tintColor = [UIColor blueColor];
    return self.imageView.image;
}


@end
