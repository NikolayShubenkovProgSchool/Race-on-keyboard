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

@end

@implementation CarsChoiseAndColors

-(UIImage *)changeCarsColor:(UISlider *)slider{
    
    UIImageView *imageView = [UIImageView new];
    
    self.numberOfCar = arc4random_uniform(3) + 1;
    NSLog(@"random%ld", (long)self.numberOfCar);
    
    // проверка на совпадение 1 и 2 машины
    if (self.numberOfCar != self.checkRepeatNumberOfCar && self.numberOfCar != self.checkRepeatNumberOfCarTwice) {
        
        UIImage *originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", (long)self.numberOfCar]];
        UIImage *tintedImage = [originalImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        imageView = [[UIImageView alloc] initWithImage:tintedImage];
        
        //меняем цвет машин, создать класс для смены через приложение
        //slider.tintColor = [UIColor magentaColor];
        
        [slider setThumbImage:originalImage forState:UIControlStateNormal];
        
        self.checkRepeatNumberOfCar = self.numberOfCar;
        
        if (self.checkAboutRepeat < 1) {
            self.checkAboutRepeat++;
            self.checkRepeatNumberOfCarTwice = self.numberOfCar;
        }
    }else{
        [self changeCarsColor:slider];
    }
    
    return imageView.image;
}


@end
