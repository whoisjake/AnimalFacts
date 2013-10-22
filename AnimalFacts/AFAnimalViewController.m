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

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *factLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 190.0f,300.0f,300.0f)];
    factLabel.text = self.animalFact;
    factLabel.adjustsFontSizeToFitWidth = YES;
    factLabel.lineBreakMode = NSLineBreakByWordWrapping;
    factLabel.numberOfLines = 0;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.animalImage];
    imageView.frame = CGRectMake(10.0f, 75.0f, 300.0f, 200.0f);
    
    self.view = view;
    [self.view addSubview:factLabel];
    [self.view addSubview:imageView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
