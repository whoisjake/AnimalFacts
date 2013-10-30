//
//  AFAnimalNotesViewController.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/24/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimalNotesViewController.h"
#import "NSFileManager+DirectoryLocations.h"

@interface AFAnimalNotesViewController ()

@end

@implementation AFAnimalNotesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *path = [[NSFileManager defaultManager] documentsDirectoryPath];
        path = [path stringByAppendingPathComponent:@"animalNotes.text"];
        
        self.filePath = path;
    }
    return self;
}

- (void) saveToDisk {
    [NSKeyedArchiver archiveRootObject:self.notesTextView.text toFile:self.filePath];
}

- (void) loadFromDisk {
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.filePath]) {
        self.notesTextView.text = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    }
}

- (void)viewDidDisappear:(BOOL)animated  {
    [self saveToDisk];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(tappedSave:)];
}

- (void) tappedSave:(id)sender {
    [self saveToDisk];
    [self.view endEditing:YES];
}

@end
