//
//  AFAnimal.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/29/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "AFAnimal.h"
#import "NSFileManager+DirectoryLocations.h"

@implementation AFAnimal {
    UIImage * _picture;
}

+ (NSMutableArray*) loadAnimals {
    NSMutableArray *allAnimals = [[NSMutableArray alloc] init];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self animalsPath]]) {
        allAnimals = [NSKeyedUnarchiver unarchiveObjectWithFile:[self animalsPath]];
    }
    
    return allAnimals;
}

+ (void) saveAnimals: (NSMutableArray *) animals {
    [NSKeyedArchiver archiveRootObject:animals toFile:[self animalsPath]];
    for(AFAnimal *animal in animals) {
        [animal savePicture];
    }
}

+ (NSString*) animalsPath {
    static dispatch_once_t onceToken;
    static NSString * animalsPath;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSFileManager defaultManager] documentsDirectoryPath];
        animalsPath = [path stringByAppendingPathComponent:@"animals.dat"];
    });
    
    return animalsPath;
}

- (UIImage *) picture {
    if (_picture != nil) return _picture;
    
    NSString *imagePath = [[[NSFileManager defaultManager] documentsDirectoryPath] stringByAppendingPathComponent:[self imageFileName]];
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (void) setPicture:(UIImage *)picture {
    _picture = picture;
}

- (NSString*) imageFileName {
    return [NSString stringWithFormat: @"%@Image.jpeg", self.name];
}

- (void) savePicture {
    if (_picture == nil) return;
    NSString *imagePath = [[[NSFileManager defaultManager] documentsDirectoryPath] stringByAppendingPathComponent:[self imageFileName]];
    NSData *imageData = UIImagePNGRepresentation(_picture);
    [imageData writeToFile:imagePath atomically:YES];
}

- (NSComparisonResult)compare:(AFAnimal *) otherAnimal {
    return [self.name compare:otherAnimal.name];
}

#pragma mark NSCoding

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_name     forKey:AFAnimalNameKey];
    [encoder encodeObject:_species  forKey:AFAnimalSpeciesKey];
    [encoder encodeObject:_fact     forKey:AFAnimalFactKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    _name = [decoder decodeObjectForKey:AFAnimalNameKey];
    _species = [decoder decodeObjectForKey:AFAnimalSpeciesKey];
    _fact = [decoder decodeObjectForKey:AFAnimalFactKey];
    return self;
}

@end
