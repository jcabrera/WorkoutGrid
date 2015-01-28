//
//  CurrentMachineViewController.m
//  WorkoutGrid
//
//  Created by Jennifer Cabrera on 1/26/15.
//  Copyright (c) 2015 Jennifer Cabrera. All rights reserved.
//

#import "CurrentMachineViewController.h"
#define kMinuteComponent 0
#define kSecondComponent 1

@interface CurrentMachineViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *weightPicker;
@property(weak,nonatomic) IBOutlet UIPickerView *timePicker;
@property (strong, nonatomic) NSMutableArray *machineWeights;
@property (strong, nonatomic) NSMutableArray *minutes;
@property (strong, nonatomic) NSMutableArray *seconds;

@end

@implementation CurrentMachineViewController

@synthesize currentMachineDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.machineWeights = [@[] mutableCopy];
    for (int i = 0; i < 100; i++) {
        NSNumber *weight = [NSNumber numberWithInt:(i+1) * 5];
        [self.machineWeights addObject:weight];
    }
    self.minutes = [@[] mutableCopy];
    self.seconds = [@[] mutableCopy];
    for (int i = 0; i < 6; i++) {
        NSNumber *minute = [NSNumber numberWithInt:(i)];
        [self.minutes addObject:minute];
    }
    for (int i = 0; i < 12; i++) {
        NSNumber *second = [NSNumber numberWithInt:(i * 5)];
        [self.seconds addObject:second];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    NSInteger selectedWeightRow = [self.weightPicker selectedRowInComponent:0];
    NSInteger completedWeight = (selectedWeightRow + 1) * 5;
    NSInteger selectedMinuteRow = [self.timePicker selectedRowInComponent:kMinuteComponent];
    NSInteger selectedSecondRow = [self.timePicker selectedRowInComponent:kSecondComponent];
    NSInteger elapsedSeconds = selectedSecondRow * 5;
    NSString *completedTime = [NSString stringWithFormat:@"%ld:%ld", (long)selectedMinuteRow, (long)elapsedSeconds];
    if([self.currentMachineDelegate respondsToSelector:@selector(currentMachineViewControllerDismissed:elapsedTime:)])
    {
        [self.currentMachineDelegate currentMachineViewControllerDismissed:completedWeight elapsedTime:completedTime];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    if (pickerView == self.weightPicker){
        return 1;}
    else if (pickerView == self.timePicker){
        return 2;
    }
        else return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    
    if (pickerView == self.weightPicker){
        return [self.machineWeights count];}
    else {
        if (component == kMinuteComponent) {
            return [self.minutes count];
        } else {
            return [self.seconds count];
        }
    }
    
    }

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (pickerView == self.weightPicker){
        return 50;}
    else {
        if (component == kMinuteComponent) {
            return 30;
        } else {
            return 50;
        }
    }
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (pickerView == self.weightPicker) {
    NSString *titleString = [[NSString alloc] initWithFormat:@"%@", self.machineWeights[row]];
    return titleString;
    }
    else {
        if (component == kMinuteComponent) {
            NSString *titleString = [[NSString alloc] initWithFormat:@"%@", self.minutes[row]];
            return titleString;
            
        } else {
            NSString *titleString = [[NSString alloc] initWithFormat:@"%@", self.seconds[row]];
            return titleString;
        
    }
    
    }
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
