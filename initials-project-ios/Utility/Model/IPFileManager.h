//
//  IPFileManager.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IPFileManager : NSObject

+ (NSArray<NSData *> *)getAllFilesDataForPath:(NSString *)filePath;
+ (UIImage *)getImageForPath:(NSString *)imagePath;
+ (NSString *)saveImage:(UIImage *)image;
+ (void)removeImageAtPath:(NSString *)path;

@end
