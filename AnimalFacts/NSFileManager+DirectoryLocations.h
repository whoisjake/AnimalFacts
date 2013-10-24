//
//  NSFileManager+DirectoryLocations.h
//  AnimalFacts
//
//  Created by Jacob Good on 10/24/13.
//  Copyright (c) 2013 Jacob Good. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// DirectoryLocations is a set of global methods for finding the fixed location
// directoriess.
//
@interface NSFileManager (DirectoryLocations)

- (NSString*) documentsDirectoryPath;

@end