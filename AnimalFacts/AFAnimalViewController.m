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
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *animalFact = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 150.0f,300.0f, 30.0f)];
    animalFact.text = self.animalFact;
    animalFact.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:animalFact];
}

@end
