//
//  IPColorDAO.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPColorDAO.h"
#import "IPFileManager.h"

@implementation IPColorDAO

- (instancetype)initWithPath:(NSString *)path {
    if (self = [self init]) {
        NSMutableArray<IPColor *> *colors = [NSMutableArray array];
        NSArray<NSData *> *colorsData = [IPFileManager getAllFilesDataForPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]];
        for (NSData *data in colorsData) {
            NSError *error;
            IPColor *color = [IPColor fromJSONDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:&error]];
            if (!error) {
                [colors addObject:color];
            }
        }
        _colors = [NSArray arrayWithArray:colors];
    }
    return self;
}

@end
