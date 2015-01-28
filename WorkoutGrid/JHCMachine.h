//
//  JHCMachine.h
//  WorkoutGrid
//
//  Created by Jennifer Cabrera on 1/25/15.
//  Copyright (c) 2015 Jennifer Cabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHCMachine : NSObject

@property NSString *machineName;
@property NSMutableString *setupNotes;
@property NSMutableArray *workoutDates;
@property NSMutableArray *weights;
@property NSMutableArray *times;


@end
