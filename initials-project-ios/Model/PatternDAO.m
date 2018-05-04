//
//  PatternDAO.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "PatternDAO.h"
#import "IPFileManager.h"
#import "Pattern.h"

@implementation PatternDAO

static PatternDAO *shared;

- (instancetype)init {
    if (self = [super init]){
        NSMutableArray<Pattern *> *patterns = [NSMutableArray array];
        NSArray<NSData *> *patternsData = [IPFileManager getAllFilesDataForPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Patterns"]];
        for (NSData *data in patternsData) {
            NSError *error;
            Pattern *pattern = [Pattern fromJSONDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:&error]];
            if (!error) {
                [patterns addObject:pattern];
            }
        }
        _patterns = [NSArray arrayWithArray:patterns];
    }
    return self;
}

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[PatternDAO alloc] init];
    });
    return shared;
}

@end
