//
//  CarsColor.m
//  Race on keyboard
//
//  Created by Semen on 15.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "CarsCollection.h"

@interface CarsCollection ()

@property (assign , nonatomic) NSInteger checkRepeatFirstAndSecondCar;
@property (assign , nonatomic) NSInteger checkRepeatSecondAndThird;
@property (assign, nonatomic) NSInteger  checkAboutRepeat;
@property (assign , nonatomic) NSInteger numberOfCar;

@end

@implementation CarsCollection

// количество машин
-(int)quantityOfCar{
    int quantity = 16;
    
    return quantity;
}

//  проверка, чтобы машинки не попадались одинаковые
-(void)changeCarsColor:(UISlider *)slider{
    
    self.numberOfCar = arc4random_uniform([self quantityOfCar]) + 1;
    NSLog(@"random%ld", (long)self.numberOfCar);
    
    // проверка на совпадение 1 и 2 машины
    if (self.numberOfCar != self.checkRepeatFirstAndSecondCar && self.numberOfCar != self.checkRepeatSecondAndThird) {
                
        [slider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", self.numberOfCar]] forState:UIControlStateNormal];
        
        self.checkRepeatFirstAndSecondCar = self.numberOfCar;
        
        //сравнение первой и третьей машинки
        if (self.checkAboutRepeat < 1) {
            self.checkAboutRepeat++;
            self.checkRepeatSecondAndThird = self.numberOfCar;
        }
    }else{
        [self changeCarsColor:slider];
    }
}


@end
