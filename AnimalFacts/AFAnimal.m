//
//  AFAnimal.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/29/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimal.h"

@implementation AFAnimal

+ (NSMutableArray*) allAnimals {
    static dispatch_once_t onceToken;
    static NSMutableArray * allAnimals;
    dispatch_once(&onceToken, ^{
        allAnimals = [[NSMutableArray alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AnimalDetails" ofType:@"plist"];
        NSMutableArray *animals = [[NSMutableArray alloc]initWithContentsOfFile:path];
        for(NSDictionary *ad in animals) {
            AFAnimal *animal = [[AFAnimal alloc] init];
            [animal setValuesForKeysWithDictionary:ad];
            [allAnimals addObject:animal];
        }
    });
    
    return allAnimals;
}

@end
