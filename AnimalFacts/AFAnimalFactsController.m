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
#import "AFAnimalCell.h"

@interface AFAnimalFactsController ()

@end

@implementation AFAnimalFactsController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAnimals];
}

- (void) loadAnimals {
    self.animals = [AFAnimal loadAnimals];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    AFAnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    AFAnimal * animal = self.animals[indexPath.row];
    cell.animalNameLabel.text = animal.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AFAnimalViewController *vc = (AFAnimalViewController*) [segue destinationViewController];
    if ([[sender identifier] isEqualToString:@"TableCell"]) {
        // Fetch animal out of list
        vc.animal = [[AFAnimal alloc] init];
    } else {
        vc.animal = [[AFAnimal alloc] init];
    }
}

@end
