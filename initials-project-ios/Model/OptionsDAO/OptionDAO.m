//
//  OptionDAO.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "OptionDAO.h"
#import "AbstractOption.h"
#import "IPFileManager.h"

@implementation OptionDAO

- (instancetype)initWithPath:(NSString *)path class:(Class)klass{
    if (self = [self init]) {
        NSMutableArray<AbstractOption *> *options = [NSMutableArray array];
        NSArray<NSData *> *optionsData = [IPFileManager getAllFilesDataForPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]];
        for (NSData *data in optionsData) {
            NSError *error;
            AbstractOption *option = [klass fromJSONDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:&error]];
            if (!error) {
                [options addObject:option];
            }
        }
        self.options = [NSArray arrayWithArray:options];
    }
    return self;
}

@end

