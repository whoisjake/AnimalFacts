//
//  AFAnimalCounterViewController.h
//  AnimalFacts
//
//  Created by Jacob Good on 10/22/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFAnimalCounterViewController : UIViewController

@property (nonatomic) int animalCount;
@property (nonatomic,weak) IBOutlet UILabel *animalCountLabel;
@property (nonatomic,weak) IBOutlet UISlider *animalCountSlider;
@property (nonatomic,weak) IBOutlet UIStepper *animalCountStepper;

@end
