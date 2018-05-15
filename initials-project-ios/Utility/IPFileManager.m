//
//  IPFileManager.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPFileManager.h"

#define DEFAULT_IMAGE_DIRECTORY @"usersImages"
#define IMAGE_NAME_FIRST_PART @"user-image-"
#define IMAGE_FORMAT @".png"

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

+ (NSString *)saveImage:(UIImage *)image {
    NSURL *documentsURL = [[NSFileManager defaultManager]  URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy.HH.mm"];
    NSString *filename = [[IMAGE_NAME_FIRST_PART stringByAppendingString:[formatter stringFromDate:[NSDate date]]] stringByAppendingString:IMAGE_FORMAT];
    [UIImagePNGRepresentation(image) writeToURL:[documentsURL URLByAppendingPathComponent:filename] atomically:YES];
    return filename;
}

+ (UIImage *)getImageForPath:(NSString *)imagePath {
    NSURL *documentsURL = [[NSFileManager defaultManager]  URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSString *filename = imagePath;
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:[documentsURL URLByAppendingPathComponent:filename]]];
}

@end
