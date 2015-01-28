//
//  ViewController.m
//  WorkoutGrid
//
//  Created by Jennifer Cabrera on 1/23/15.
//  Copyright (c) 2015 Jennifer Cabrera. All rights reserved.
//

#import "ViewController.h"
#import "LabelCell.h"
#import "DataCell.h"
#import "NewCellCollectionViewCell.h"
#import "JHCMachine.h"
#import "CurrentMachineViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSMutableArray *machines;
@property(nonatomic, strong) NSMutableArray *machineGroupA;
@property(nonatomic, strong) NSMutableArray *workoutNums;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) CurrentMachineViewController* tapPopoverController;
@property (nonatomic, weak) IBOutlet UIButton *popOverAnchorButton;



@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.machines = [@[] mutableCopy];
    self.workoutNums = [@[] mutableCopy];
   

    
    JHCMachine *avenger = [[JHCMachine alloc] init];
    avenger.machineName = @"Avenger";
    avenger.weights = [@[] mutableCopy];
    [avenger.weights addObject:@"150"];
    avenger.times = [@[] mutableCopy];
    [avenger.times addObject:@"1:40"];
    [self.machines addObject:avenger];
    
    JHCMachine *rowMachine = [[JHCMachine alloc] init];
    rowMachine.machineName = @"Row";
    rowMachine.weights = [@[] mutableCopy];
    [rowMachine.weights addObject:@"90"];
    rowMachine.times = [@[] mutableCopy];
    [rowMachine.times addObject:@"1:50"];
    [self.machines addObject:rowMachine];
    
    
    [self.collectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return 3;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return [self.machines count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JHCMachine *currentMachine = self.machines[indexPath.section];
    if (indexPath.item == 0) {
    LabelCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"currentMachineCell" forIndexPath:indexPath];
        cell.machineLabel.text = currentMachine.machineName;
        return cell;}
    else if (indexPath.item == 1) {
        DataCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"dataCell" forIndexPath:indexPath];
        cell.weightLabel.text = currentMachine.weights[0];
        cell.timeLabel.text = currentMachine.times[0];
        return cell;
    }
    else {NewCellCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"currentWorkoutCell" forIndexPath:indexPath];
        cell.todayLabel.text = @"New";
        return cell;
        
    }
}

/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewCellCollectionViewCell *selectedCell = (NewCellCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
    CGRect displayFrom = CGRectMake(selectedCell.frame.origin.x + selectedCell.frame.size.width, selectedCell.center.y + self.collectionView.frame.origin.y - self.collectionView.contentOffset.y, 1, 1);
    self.popOverAnchorButton.frame = displayFrom;
    [self performSegueWithIdentifier:@"EnterData" sender:selectedCell];
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize retval = CGSizeMake(50, 50);
    return retval;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}
- (IBAction)buttonPressed:(id)sender {
    
}

- (void) currentMachineViewControllerDismissed: (NSInteger) completedWeight elapsedTime:(NSString *)completedTime {
    NSLog(@"Weight: %ld", completedWeight);
    NSLog (@"Time: %@", completedTime);
    
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"EnterData"]){
        
        _tapPopoverController = segue.destinationViewController;
        _tapPopoverController.currentMachineDelegate = self;
    }
        
    }


@end
