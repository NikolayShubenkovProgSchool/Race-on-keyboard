//
//  Text.m
//  Race on keyboard
//
//  Created by Semen on 14.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "Text.h"

@implementation Text

-(NSString *)russianText{
    
    NSArray *text = [NSArray arrayWithObjects:@"Трудно, даже невозможно описать, как зарождаются разные слухи.", nil];
    
    return [text objectAtIndex:arc4random_uniform(1)];
}


@end
