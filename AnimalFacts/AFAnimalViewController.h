//
//  AFAnimalViewController.h
//  AnimalFacts
//
//  Created by Jacob Good on 11/6/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFAnimal.h"

@interface AFAnimalViewController : UIViewController

@property (nonatomic,strong) AFAnimal * animal;

@property (nonatomic,weak) IBOutlet UINavigationBar * navBar;
@property (nonatomic,weak) IBOutlet UITextField * animalNameLabel;
@property (nonatomic,weak) IBOutlet UITextView * animalFactTextView;
@property (nonatomic,weak) IBOutlet UIImageView * animalImageView;
@property (nonatomic,weak) IBOutlet UIButton * photoButton;
@property (nonatomic,weak) IBOutlet UIButton * cancelButton;
@property (nonatomic,weak) IBOutlet UIButton * saveButton;

- (IBAction) photoButtonPushed:(id) sender;
- (IBAction) cancelButtonPushed:(id) sender;
- (IBAction) saveButtonPushed:(id) sender;

@end
