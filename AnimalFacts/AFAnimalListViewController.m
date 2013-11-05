//
//  AFAnimalListViewController.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/22/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimalListViewController.h"
#import "AFAnimalViewController.h"

@interface AFAnimalListViewController ()

@end

@implementation AFAnimalListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AFAnimalViewController *avc = (AFAnimalViewController *)[segue destinationViewController];
    avc.animal = [[AFAnimal allAnimals] objectAtIndex:[sender tag]];
}

- (void)viewDidLoad
{
    [self.navigationItem setHidesBackButton:YES];
    [super viewDidLoad];
}

@end
