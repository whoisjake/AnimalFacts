//
//  AFAnimal.h
//  AnimalFacts
//
//  Created by Jacob Good on 10/29/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFAnimal : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *species;
@property (nonatomic) NSString *fact;
@property (nonatomic) NSString *imagePath;
@property (nonatomic, strong, readonly) UIImage * image;

+ (NSMutableArray*) loadAnimals;
+ (void) saveAnimals: (NSMutableArray*) animals;

@end
