//
//  IPFileManager.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPFileManager : NSObject

+ (NSData *)getFileDataForPath:(NSString *)filePath;

+ (NSArray<NSData *> *)getAllFilesDataForPath:(NSString *)filePath;
@end