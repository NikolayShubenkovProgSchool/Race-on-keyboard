//
//  SettingsViewController.m
//  Race on keyboard
//
//  Created by Semen on 22.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "SettingsViewController.h"
#import "CarSelect.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *textLanguage;
@property (weak, nonatomic) IBOutlet UIButton *carButton;


@end

@implementation SettingsViewController

- (IBAction)textLanguageSegmentedControl:(id)sender {
    
    switch ([((UISegmentedControl *)sender) selectedSegmentIndex])
    {
        case 0:
            [self saveTextSelect:@"russianText"];
            NSLog(@"case 0");
            break;
        case 1:
            [self saveTextSelect:@"englishText"];
            NSLog(@"case 1");
            break;
        default: //Make sure this button is checked off as Selected in IB
            NSLog(@"case default");
            break;
    }
    return;
    
}

-(void)saveTextSelect:(NSString *)string{
    NSString *valueToSave = [NSString stringWithFormat:@"%@", string];
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"textSelect"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)loadTextSelect{
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"textSelect"];
    
    return savedValue;
}

-(void)selectSegmentedControll{
    
    if ([[self loadTextSelect] isEqualToString:@"russianText"]) {
        self.textLanguage.selectedSegmentIndex = 0;
    }
    if ([[self loadTextSelect] isEqualToString:@"englishText"]) {
        self.textLanguage.selectedSegmentIndex = 1;
    }
    
}

-(void)setup{
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1];
////    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
//    self.textLanguage.tintColor = [UIColor whiteColor];
    [self setupButton];
    [self selectSegmentedControll];
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(void)setupButton{

//    self.carButton = [UIButton buttonWithType:UIButtonTypeSystem];

//    [self.carButton setTitle:[NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"playerCar"]] forState:UIControlStateNormal];
    [self.carButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
//    self.carButton.frame = CGRectMake(self.view.center.x, self.view.center.y, 90, 90);
//    self.carButton.center = CGPointMake(self.view.center.x, self.view.center.y);
//    
    // Add an action in current code file (i.e. target)
    [self.carButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"playerCar"]]] forState:UIControlStateNormal];

//    [self.view addSubview:self.carButton];
    NSLog(@"work");

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

@end
