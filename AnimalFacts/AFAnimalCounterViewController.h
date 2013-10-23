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
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UISlider *countSlider;
@property (nonatomic, strong) UIStepper *countStepper;

@end
