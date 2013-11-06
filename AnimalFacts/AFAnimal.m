//
//  AFAnimal.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/29/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimal.h"

@implementation AFAnimal

+ (NSMutableArray*) loadAnimals {
    NSMutableArray *allAnimals = [[NSMutableArray alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AnimalDetails" ofType:@"plist"];
    NSMutableArray *animals = [[NSMutableArray alloc]initWithContentsOfFile:path];
    for(NSDictionary *ad in animals) {
        AFAnimal *animal = [[AFAnimal alloc] init];
        [animal setValuesForKeysWithDictionary:ad];
        [allAnimals addObject:animal];
    }
    
    return allAnimals;
}

+ (void) saveAnimals: (NSMutableArray *) animals {
    
}

- (NSComparisonResult)compare:(AFAnimal *) otherAnimal {
    return [self.name compare:otherAnimal.name];
}

- (UIImage*) image {
    return [UIImage imageNamed:self.imagePath];
}

@end
