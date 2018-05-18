//
//  IPFileManager.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPFileManager.h"

#define IMAGE_NAME_FIRST_PART @"user-image-"
#define IMAGE_FORMAT @".png"

@implementation IPFileManager


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

+ (NSString *)saveImage:(UIImage *)image {
    NSURL *documentsURL = [[NSFileManager defaultManager]  URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSString *filename = [NSString stringWithFormat:@"%@%@%@", IMAGE_NAME_FIRST_PART, [NSDate date], IMAGE_FORMAT];
    [UIImagePNGRepresentation(image) writeToURL:[documentsURL URLByAppendingPathComponent:filename] atomically:YES];
    return filename;
}

+ (UIImage *)getImageForPath:(NSString *)imagePath {
    NSURL *documentsURL = [[NSFileManager defaultManager]  URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSString *filename = imagePath;
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:[documentsURL URLByAppendingPathComponent:filename]]];
}

+ (void)removeImageAtPath:(NSString *)path {
    NSURL *documentsURL = [[NSFileManager defaultManager]  URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtURL:[documentsURL URLByAppendingPathComponent:path] error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
}
@end
