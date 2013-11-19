//
//  AFAnimalViewController.m
//  AnimalFacts
//
//  Created by Jacob Good on 11/6/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimalViewController.h"
#import "AFAnimal.h"

@import AssetsLibrary;

@interface AFAnimalViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate, UITextFieldDelegate>

@end

@implementation AFAnimalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textViewShouldReturn:(UITextView *)textView {
    [textView resignFirstResponder];
    return YES;
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
    self.animalFactTextView.text = self.animal.fact;
    
    if (self.animal.picture != nil) {
        self.animalImageView.image = self.animal.picture;
        [self.photoButton setTitle:@"Change Photo" forState:UIControlStateNormal];
    } else {
        [self.animalImageView sizeToFit];
        [self.photoButton setTitle:@"Pick Photo" forState:UIControlStateNormal];
    }
    
}

- (void) saveToAnimal {
    self.animal.name = self.animalNameLabel.text;
    self.animal.fact = self.animalFactTextView.text;
    self.animal.picture = self.animalImageView.image;
    [[NSNotificationCenter defaultCenter] postNotificationName:AFAnimalSubjectSaved object:self];
}

- (IBAction) cancelButtonPushed:(id) sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:AFAnimalSubjectCancelled object:self];
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction) saveButtonPushed:(id) sender {
    [self.view endEditing:YES];
    [self saveToAnimal];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction) photoButtonPushed:(id) sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    else
    {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    picker.delegate = self;
    picker.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.animalImageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
