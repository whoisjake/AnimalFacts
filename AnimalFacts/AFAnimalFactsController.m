//
//  AFAnimalFactsController.m
//  AnimalFacts
//
//  Created by Jacob Good on 11/5/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimalFactsController.h"
#import "AFAnimalViewController.h"
#import "AFAnimal.h"

@interface AFAnimalFactsController ()

@end

@implementation AFAnimalFactsController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animals = [AFAnimal loadAnimals];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(saveSubject:)
                                                 name:AFAnimalSubjectSaved
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(clearSubject:)
                                                 name:AFAnimalSubjectCancelled
                                               object:nil];
}

- (void) saveAnimals {
    [AFAnimal saveAnimals:self.animals];
}

- (void) clearSubject:(id) sender {
    self.subject = nil;
}

- (void) saveSubject:(id) sender {
    if (self.subject != nil) {
        [self.animals addObject:self.subject];
        [self saveAnimals];
        [self.animalTableView reloadData];
    }
}

- (void) dealloc {
    [self clearSubject:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AFAnimalSubjectSaved object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AFAnimalSubjectCancelled object:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.animals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    AFAnimal * animal = self.animals[indexPath.row];
    cell.textLabel.text = animal.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.animals removeObjectAtIndex:indexPath.row];
        [self saveAnimals];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AFAnimalViewController *vc = (AFAnimalViewController*) [segue destinationViewController];
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        // Fetch animal out of list
        UITableViewCell * cell = (UITableViewCell*) sender;
        NSIndexPath * indexPath = [self.animalTableView indexPathForCell:cell];
        vc.animal = self.animals[indexPath.row];
    } else {
        self.subject = [[AFAnimal alloc] init];
        vc.animal = self.subject;
    }
}

@end
