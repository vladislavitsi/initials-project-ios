//
//  UserData.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "UserData.h"
#import "IPFileManager.h"

@implementation UserData

- (instancetype)initWithName:(NSString *)name imagePath:(NSString *)path {
    if (self = [super init]) {
        self.name = name;
        self.imagePath = path;
    }
    return self;
}

- (UIImage *)getImage {
    return [UIImage imageWithData:[IPFileManager getFileDataForPath:self.imagePath]];
}

- (NSData *)toJSON {
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionary];
    jsonDict[@"name"] = self.name;
    jsonDict[@"imagePath"] = self.imagePath;
    return [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
}

+ (instancetype)fromJSON:(NSData *)jsonData {
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    UserData *userData = [[UserData alloc] initWithName:jsonDict[@"name"] imagePath:jsonDict[@"imagePath"]];
    return userData;
}
@end
