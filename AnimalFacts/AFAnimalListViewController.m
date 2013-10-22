//
//  AFAnimalListViewController.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/22/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimalListViewController.h"
#import "AFAnimalViewController.h"

@interface AFAnimalListViewController ()

@end

@implementation AFAnimalListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage * birdImage = [UIImage imageNamed:@"23-bird"];
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Animals" image:birdImage tag:11];
        self.title = @"Animals";
    }
    return self;
}

- (void) loadView {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    
    self.view = view;
    
    UIButton *dingoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *eagleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *griffinButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    dingoButton.frame = CGRectMake(110.0f, 100.0f, 100.0f, 30.0f);
    eagleButton.frame = CGRectMake(110.0f, 175.0f, 100.0f, 30.0f);
    griffinButton.frame = CGRectMake(110.0f, 250.0f, 100.0f, 30.0f);
    
    [dingoButton addTarget:self action:@selector(dingoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [eagleButton addTarget:self action:@selector(eagleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [griffinButton addTarget:self action:@selector(griffinButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [dingoButton setTitle:@"Dingo" forState:UIControlStateNormal];
    [eagleButton setTitle:@"Harpy Eagle" forState:UIControlStateNormal];
    [griffinButton setTitle:@"Griffon" forState:UIControlStateNormal];
    
    [self.view addSubview:dingoButton];
    [self.view addSubview:eagleButton];
    [self.view addSubview:griffinButton];
}

- (void)dingoButtonPressed:(id)sender {
    AFAnimalViewController *animalViewController = [[AFAnimalViewController alloc] initWithNibName:nil bundle:nil];
    animalViewController.title = @"Dingo";
    animalViewController.animalFact = @"The dingo (Canis lupus dingo) is a free-roaming dog found mainly in Australia, as well as Southeast Asia, where it is said to have originated. It is currently classified as a subspecies of the grey wolf, Canis lupus.";
    animalViewController.animalImage = [UIImage imageNamed:@"Dingo_walking"];
    [self.navigationController pushViewController:animalViewController animated:YES];
}

- (void)eagleButtonPressed:(id)sender {
    AFAnimalViewController *animalViewController = [[AFAnimalViewController alloc] initWithNibName:nil bundle:nil];
    animalViewController.title = @"Harpy Eagle";
    animalViewController.animalFact = @"The Harpy Eagle (Harpia harpyja) is a Neotropical species of eagle. It is sometimes known as the American Harpy Eagle to distinguish it from the Papuan Eagle which is sometimes known as the New Guinea Harpy Eagle or Papuan Harpy Eagle.[3] It is the largest and most powerful raptor found in the Americas,[4] and among the largest extant species of eagles in the world.";
    animalViewController.animalImage = [UIImage imageNamed:@"686px-Harpia_harpyja_-falconry_-head-8a"];
    [self.navigationController pushViewController:animalViewController animated:YES];
}

- (void)griffinButtonPressed:(id)sender {
    AFAnimalViewController *animalViewController = [[AFAnimalViewController alloc] initWithNibName:nil bundle:nil];
    animalViewController.title = @"Griffin";
    animalViewController.animalFact = @"The griffin, griffon, or gryphon (Greek: γρύφων, grýphōn, or γρύπων, grýpōn, early form γρύψ, grýps; Latin: gryphus) is a legendary creature with the body, tail, and back legs of a lion; the head and wings of an eagle; and an eagle's talons as its front feet.";
    animalViewController.animalImage = [UIImage imageNamed:@"Scagryn0013"];
    [self.navigationController pushViewController:animalViewController animated:YES];
}

- (void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(tappedBack:)];
    [super viewDidLoad];
}

- (void) tappedBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
}

@end
