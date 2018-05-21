//
//  OptionDAO.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "OptionDAO.h"
#import "AbstractOption.h"

@implementation OptionDAO

- (instancetype)initWithFileName:(NSString *)path class:(Class)klass{
    if (self = [self init]) {
        NSMutableArray<AbstractOption *> *options = [NSMutableArray array];
        NSData *dataOfFile = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]];
        
        NSError *error;
        NSArray<NSDictionary *> *optionsJSONDictionaries = [NSJSONSerialization JSONObjectWithData:dataOfFile options:0 error:&error];
        
        if (!error) {
            for (NSDictionary *jsonDictionary in optionsJSONDictionaries) {
                [options addObject:[klass fromJSONDictionary:jsonDictionary]];
            }
        }
        
        self.options = [NSArray arrayWithArray:options];
    }
    return self;
}

@end

