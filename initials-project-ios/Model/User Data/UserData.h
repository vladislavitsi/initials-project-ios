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
@property (nonatomic, copy) NSString *imagePath;

- (instancetype)initWithName:(NSString *)name imagePath:(NSString *)path;

- (UIImage *)getImage;

- (NSData *)toJSON;

+ (instancetype)fromJSON:(NSData *)jsonData;
@end
