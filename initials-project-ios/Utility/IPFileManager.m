//
//  IPFileManager.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPFileManager.h"

@implementation IPFileManager

+ (NSData *)getFileDataForPath:(NSString *)filePath {
    return [NSData dataWithContentsOfFile:filePath];
}

+ (NSArray<NSData *> *)getAllFilesDataForPath:(NSString *)directoryPath {
    NSMutableArray<NSData *> *array = [NSMutableArray array];
    
    NSError *error;
    NSArray<NSString *> *searchResult = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:&error];
    
    if (error) {
        NSLog(@"Invalid directory path");
    } else {
        for (NSString *fileName in searchResult) {
            NSString *filePath = [directoryPath stringByAppendingPathComponent:fileName];
            [array addObject:[NSData dataWithContentsOfFile:filePath]];
        }
    }
    
    return [NSArray arrayWithArray:array];
}

@end
