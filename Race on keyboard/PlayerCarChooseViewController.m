//
//  PlayerCarChooseViewController.m
//  Race on keyboard
//
//  Created by Semen on 15.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "PlayerCarChooseViewController.h"
#import "CarsCollection.h"
#import "RaceViewController.h"

@interface PlayerCarChooseViewController ()

@property (weak) UIScrollView *scrollView; //что это
@property (strong, nonatomic) id note;

@end

@implementation PlayerCarChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self listOfCarToSelect];
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:87/255.0 green:176/255.0 blue:255/255.0 alpha:1];

    
    // Do any additional setup after loading the view.
}

-(void)listOfCarToSelect{
    CarsCollection *quantity = [CarsCollection new];
    
    NSInteger y = self.view.center.y / 2.3;
    NSInteger moveToTheRight = 1;
    NSInteger moveToTheDownward = 0;
    NSInteger carToShow = 1;
    
    for (int i = 0; i != [quantity quantityOfCar]; i++) {
        NSInteger x = self.view.center.x / 2;
        
        if (moveToTheRight == 2) {
            
            moveToTheRight = 0;
            x+=self.view.center.x;
        }
        if (moveToTheDownward == 2) {
            
            y+=self.view.center.y / 5;
            moveToTheDownward = 0;
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:[NSString stringWithFormat:@"car%ld.png", (long)carToShow] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(x, y, 90, 90);
        button.center = CGPointMake(x, y);

        
        // Add an action in current code file (i.e. target)
        [button addTarget:self action:@selector(buttonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", (long)carToShow]] forState:UIControlStateNormal];
        
        [self.view addSubview:button];
        
        carToShow++;
        moveToTheRight++;
        moveToTheDownward++;
    }
}



- (void)buttonPressed:(UIButton *)button {
    RaceViewController *player = [RaceViewController new];
    player.car = [NSString stringWithFormat:@"%@", button.currentTitle];
    NSLog(@"Button Pressed %@", button.currentTitle);
    self.note = [NSString stringWithFormat:@"%@", button.currentTitle];
    [self fileName];
    [self saveToFile];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

//    
    RaceViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"RaceViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:YES completion:nil];
}

#pragma mark - NSData

- (NSString *)fileName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *cachePath = [paths objectAtIndex:0];
    
    
    BOOL isDir = NO;
    
    NSError *error;
    
    if (! [[NSFileManager defaultManager] fileExistsAtPath:cachePath isDirectory:&isDir] && isDir == NO) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:cachePath withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    
    return [NSString stringWithFormat:@"%@/mynotes.data", cachePath];
    
}

-(void)saveToFile {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.note];
     [data writeToFile:[self fileName] atomically:NO];
}

- (NSString*)loadFromFile {
    NSData *data = [NSData dataWithContentsOfFile: [self fileName]];
    self.note = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (!self.note) {
        self.note = [PlayerCarChooseViewController new];
    }
    NSLog(@"загрузка пашет");
    
    NSString *string = [NSString stringWithFormat:@"%@", self.note];

    return string;
    
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
