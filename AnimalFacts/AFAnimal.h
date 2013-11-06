//
//  AFAnimal.h
//  AnimalFacts
//
//  Created by Jacob Good on 10/29/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString * const AFAnimalSubjectSaved = @"AFAnimalSubjectSaved";
NSString * const AFAnimalSubjectCancelled = @"AFAnimalSubjectCancelled";

NSString * const AFAnimalNameKey = @"Name";
NSString * const AFAnimalSpeciesKey = @"Species";
NSString * const AFAnimalFactKey = @"Fact";
NSString * const AFAnimalImageKey = @"Image";

@interface AFAnimal : NSObject <NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *species;
@property (nonatomic) NSString *fact;
@property (nonatomic) UIImage  *picture;

- (void) savePicture;

+ (NSMutableArray*) loadAnimals;
+ (void) saveAnimals: (NSMutableArray*) animals;

@end
