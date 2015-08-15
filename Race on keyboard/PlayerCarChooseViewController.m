//
//  PlayerCarChooseViewController.m
//  Race on keyboard
//
//  Created by Semen on 15.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "PlayerCarChooseViewController.h"

@interface PlayerCarChooseViewController ()

@property (weak) UIScrollView *scrollView;



@end

@implementation PlayerCarChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view.
}

-(void)test{
    NSInteger x = 40;
    NSInteger y = 60;
    NSInteger c = 0;
    for (int i = 0; i < 4; i++) {
        if (c == 2) {
            y = y + 60;
            c = 0;
            x = 40;
        }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button sizeToFit];
    
    button.frame = CGRectMake(320/2 , 536/2, 90, 90);
    button.center = CGPointMake(40 + x, y);
    
    // Add an action in current code file (i.e. target)
    [button addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"car1.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
        c++;
        x = x+100;
    }
    

}



- (void)buttonPressed:(UIButton *)button {
    NSLog(@"Button Pressed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
