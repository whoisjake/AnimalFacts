//
//  NSFileManager+DirectoryLocations.m
//  AnimalFacts
//
//  Created by Jacob Good on 10/24/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import "NSFileManager+DirectoryLocations.h"

@implementation NSFileManager (DirectoryLocations)

//
// documentsDirectoryPath
//
// Returns the path to the documentsDirectoryPath.
//
- (NSString*) documentsDirectoryPath {
    static dispatch_once_t onceToken;
    static NSString * documentsPath;
    dispatch_once(&onceToken, ^{
        documentsPath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, NO)[0];
    });
    
    
    return documentsPath;
}

@end
