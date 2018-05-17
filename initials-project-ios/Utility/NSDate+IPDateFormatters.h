//
// Created by Uladzislau Kleshchanka on 5/17/18.
// Copyright (c) 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (IPDateFormatters)

- (NSString *)getFormattedDate;
+ (instancetype)getDateFromFormattedString:(NSString *)formattedString;

@end