//
//  UserData.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserData : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, copy) NSString *imagePath;

- (instancetype)initWithName:(NSString *)name creationDate:(NSDate *)creationDate imagePath:(NSString *)path;

- (UIImage *)getImage;

- (void)removeImage;

- (NSData *)toJSON;

+ (instancetype)fromJSON:(NSData *)jsonData;
@end
