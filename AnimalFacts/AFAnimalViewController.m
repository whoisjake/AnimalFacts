//
//  AFAnimalViewController.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/22/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimalViewController.h"

@interface AFAnimalViewController ()

@end

@implementation AFAnimalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void) setAnimal:(AFAnimal *)animal {
    _animal = animal;
    [self updateFromAnimal];
}

- (void) viewDidLoad {
    [self updateFromAnimal];
}

- (void) updateFromAnimal {
    self.animalNameLabel.text = self.animal.name;
    self.animalSpeciesLabel.text = self.animal.species;
    self.animalFactLabel.text = self.animal.fact;
    self.animalImageView.image = self.animal.image;
}

@end
