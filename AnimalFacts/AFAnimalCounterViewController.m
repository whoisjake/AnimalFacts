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
        UIImage * birdImage = [UIImage imageNamed:@"161-calculator"];
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Counter" image:birdImage tag:11];
    }
    return self;
}

- (void) loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
}

@end
