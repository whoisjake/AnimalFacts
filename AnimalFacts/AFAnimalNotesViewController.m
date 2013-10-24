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
        UIImage *noteImage = [UIImage imageNamed:@"179-notepad"];
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Notes" image:noteImage tag:11];
        self.title = @"Notes";
        
        NSString *path = [[NSFileManager defaultManager] documentsDirectoryPath];
        path = [path stringByAppendingPathComponent:@"animalNotes.text"];
        
        self.filePath = path;
    }
    return self;
}

- (void)loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    
    self.notesTextView = [[UITextView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    [self loadFromDisk];
    
    self.view = view;
    [self.view addSubview:self.notesTextView];
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
