//
//  CurrentMachineViewController.h
//  WorkoutGrid
//
//  Created by Jennifer Cabrera on 1/26/15.
//  Copyright (c) 2015 Jennifer Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CurrentMachineDelegate <NSObject>
- (void) currentMachineViewControllerDismissed: (NSInteger) completedWeight elapsedTime:(NSString *)completedTime;
@end

@interface CurrentMachineViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>



@property (nonatomic, assign) id<CurrentMachineDelegate>    currentMachineDelegate;

@end
