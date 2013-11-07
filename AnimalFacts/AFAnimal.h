//
//  AFAnimal.h
//  AnimalFacts
//
//  Created by Jacob Good on 10/29/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const AFAnimalSubjectSaved;
extern NSString * const AFAnimalSubjectCancelled;

extern NSString * const AFAnimalNameKey;
extern NSString * const AFAnimalSpeciesKey;
extern NSString * const AFAnimalFactKey;
extern NSString * const AFAnimalImageKey;

@interface AFAnimal : NSObject <NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *species;
@property (nonatomic) NSString *fact;
@property (nonatomic) UIImage  *picture;

- (void) savePicture;

+ (NSMutableArray*) loadAnimals;
+ (void) saveAnimals: (NSMutableArray*) animals;

@end
