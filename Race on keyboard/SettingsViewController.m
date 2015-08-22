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
@property (weak, nonatomic) IBOutlet UIButton *currentCar;

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

-(void)setup{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
    self.textLanguage.tintColor = [UIColor whiteColor];
    [self setupButton];
}

-(void)setupButton{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:[NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"playerCar"]] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(self.view.center.x, self.view.center.y, 90, 90);
    button.center = CGPointMake(self.view.center.x, self.view.center.y);
    
    
    // Add an action in current code file (i.e. target)
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"playerCar"]]] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    NSLog(@"work");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
