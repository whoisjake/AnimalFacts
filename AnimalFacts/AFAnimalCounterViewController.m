//
//  AFAnimalCounterViewController.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/22/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimalCounterViewController.h"

@interface AFAnimalCounterViewController ()

@end

@implementation AFAnimalCounterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self changeCount:0.0f];
    }
    return self;
}

-(IBAction)sliderMoved:(id) sender {
    [self changeCount:(int)roundf(self.animalCountSlider.value)];
}

-(IBAction)stepperChanged:(id) sender {
    if ((self.animalCount < 0) || (self.animalCount < 50)) {
        [self changeCount:self.animalCountStepper.value];
    }
}

-(void)changeCount:(int) value {
    self.animalCount = value;
    [self updateLabel];
    self.animalCountSlider.value = self.animalCount;
    self.animalCountStepper.value = self.animalCount;
}

-(void)updateLabel {
    self.animalCountLabel.text = [NSString stringWithFormat:@"%d",self.animalCount];
}

@end
