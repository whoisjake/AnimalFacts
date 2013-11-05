//
//  AFAnimalViewController.h
//  AnimalFacts
//
//  Created by Jacob Good on 10/22/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFAnimal.h"

@interface AFAnimalViewController : UIViewController

@property (nonatomic, strong) AFAnimal *animal;

@property (nonatomic,weak) IBOutlet UILabel *animalNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *animalSpeciesLabel;
@property (nonatomic,weak) IBOutlet UIImageView *animalImageView;
@property (nonatomic,weak) IBOutlet UILabel *animalFactLabel;

@end
