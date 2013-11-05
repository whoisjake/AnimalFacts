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
    }
    return self;
}

- (NSString*) notesPath {
    static dispatch_once_t onceToken;
    static NSString * notesPath;
    dispatch_once(&onceToken, ^{
        [[NSFileManager defaultManager] documentsDirectoryPath];
        NSString *path = [[NSFileManager defaultManager] documentsDirectoryPath];
        notesPath = [path stringByAppendingPathComponent:@"animalNotes.text"];
    });
    
    return notesPath;
}

- (void) saveToDisk {
    [NSKeyedArchiver archiveRootObject:self.notesTextView.text toFile:[self notesPath]];
}

- (void) loadFromDisk {
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self notesPath]]) {
        self.notesTextView.text = [NSKeyedUnarchiver unarchiveObjectWithFile:[self notesPath]];
    }
}

- (void)viewDidDisappear:(BOOL)animated  {
    [self saveToDisk];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(tappedSave:)];
    [self loadFromDisk];
}

- (void) tappedSave:(id)sender {
    [self saveToDisk];
    [self.view endEditing:YES];
}

@end
