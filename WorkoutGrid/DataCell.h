//
//  DataCell.h
//  WorkoutGrid
//
//  Created by Jennifer Cabrera on 1/25/15.
//  Copyright (c) 2015 Jennifer Cabrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
