//
//  RaceViewController.m
//  Race on keyboard
//
//  Created by Semen on 11.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "RaceViewController.h"
#import "Race.h"
#import "CarsCollection.h"
#import "CarSelect.h"
#import "YouWinViewController.h"
#import "YouLoseViewController.h"
#import "BotView.h"
#import "trafficOneTwoThreeViewController.h"

@interface RaceViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderOne;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderTwo;
@property (weak, nonatomic) IBOutlet UISlider *playerProgressRaceSlider;

@property (nonatomic) Race* raceProperty;
@property (nonatomic) CarsCollection* makeCar;
@property (nonatomic) BotView* bot;
@property (nonatomic) trafficOneTwoThreeViewController* goRace;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)setup{
    self.raceProperty = [[Race alloc] init];
    self.makeCar = [[CarsCollection alloc] init];
    self.bot = [[BotView alloc] init];
    [self.enterRaceTextField becomeFirstResponder];

    [self setupMoreSlider];
    [self.raceProperty setUpTextInRace:self.textView AndMakeMaxValueOfSlider:self.playerProgressRaceSlider];
    self.playerProgressRaceSlider.value = 0;
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
}

-(void)setupSider:(UISlider *)slider{

    NSLog(@"setup");
    slider.minimumTrackTintColor = [UIColor clearColor];
    slider.maximumTrackTintColor = [UIColor clearColor];
    slider.userInteractionEnabled = NO;
    slider.value = 0;
}

-(void)playerSliderSetup{
    
    CarSelect* car = [CarSelect new];
    [self.playerProgressRaceSlider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ ", [car loadFromFile]]] forState:UIControlStateNormal];
    NSLog(@"машинка игрока установлена");
    [self setupSider:self.playerProgressRaceSlider];
}

-(void)setupMoreSlider{
    [self playerSliderSetup];
    
    NSArray *sliders = [[NSArray alloc] initWithObjects: self.opponentSliderOne, self.opponentSliderTwo, nil];

    for (id n in sliders) {
        [self setupSider:n];
        [self.makeCar changeCarsColor:n];
        NSLog(@"бот настроен");

    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.bot setEasyBotByTimer:self.opponentSliderOne];
    [self.bot setEasyBotByTimer:self.opponentSliderTwo];
    NSLog(@"wiilappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    NSLog(@"didload");
}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
    
    [self.raceProperty edittingLetter:self.playerProgressRaceSlider and:self.textView :self.enterRaceTextField];
    if (self.playerProgressRaceSlider.value == self.playerProgressRaceSlider.maximumValue) {
       [self performSelector:@selector(youWin)
                  withObject:nil
                  afterDelay:0.5];
    }
    if (self.opponentSliderOne.value == self.opponentSliderOne.maximumValue || self.opponentSliderTwo.value == self.opponentSliderTwo.maximumValue) {
        [self youLose];
    }

}

-(void)youWin{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YouWinViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"YouWinViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:NO completion:nil];
}

-(void)youLose{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YouLoseViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"YouLoseViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:NO completion:nil];
}


@end
