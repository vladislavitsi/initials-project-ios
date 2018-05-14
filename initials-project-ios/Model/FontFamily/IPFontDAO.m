//
//  IPFontDAO.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "IPFontDAO.h"
#import "IPFont.h"
#import "IPFileManager.h"

@implementation IPFontDAO

- (instancetype)initWithPath:(NSString *)path {
    if (self = [self init]) {
        NSMutableArray<IPFont *> *fonts = [NSMutableArray array];
        NSArray<NSData *> *fontsData = [IPFileManager getAllFilesDataForPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]];
        for (NSData *data in fontsData) {
            NSError *error;
            IPFont *font = [IPFont fromJSONDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:&error]];
            if (!error) {
                [fonts addObject:font];
            }
        }
        self.options = [NSArray arrayWithArray:fonts];
    }
    return self;
}

@end
