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
        UIImage *birdImage = [UIImage imageNamed:@"161-calculator"];
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Counter" image:birdImage tag:11];
        self.animalCount = 0.0f;
    }
    return self;
}

- (void) loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    
    self.countSlider = [[UISlider alloc] initWithFrame:CGRectMake(10.0f, 350.0f, frame.size.width - 20.0f, 50.0f)];
    self.countSlider.minimumValue = 0.0f;
    self.countSlider.maximumValue = 50.0f;
    self.countSlider.value = self.animalCount;
    [self.countSlider addTarget:self action:@selector(sliderMoved:) forControlEvents:UIControlEventValueChanged];
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 100.0f, frame.size.width, 30.0f)];
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    [self updateLabel];
    
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [plusButton addTarget:self action:@selector(plusClicked:) forControlEvents:UIControlEventTouchUpInside];
    plusButton.frame = CGRectMake(160.0f, 150.0f, 30.0f, 30.0f);
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    
    UIButton *minusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [minusButton addTarget:self action:@selector(minusClicked:) forControlEvents:UIControlEventTouchUpInside];
    minusButton.frame = CGRectMake(130.0f, 150.0f, 30.0f, 30.0f);
    [minusButton setTitle:@"-" forState:UIControlStateNormal];

    self.view = view;
    [self.view addSubview:self.countLabel];
    [self.view addSubview:plusButton];
    [self.view addSubview:minusButton];
    [self.view addSubview:self.countSlider];
}

-(void)sliderMoved:(id) sender {
    [self changeCount:(int)roundf(self.countSlider.value)];
}

-(void)plusClicked:(id) sender {
    if (self.animalCount < 50) {
        [self changeCount:self.animalCount + 1];
    }
}

-(void)minusClicked:(id) sender {
    if (self.animalCount > 0) {
        [self changeCount:self.animalCount - 1];
    }
}

-(void)changeCount:(int) value {
    self.animalCount = value;
    [self updateLabel];
    self.countSlider.value = self.animalCount;
}

-(void)updateLabel {
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.animalCount];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
}

@end
