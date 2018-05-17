//
// Created by Uladzislau Kleshchanka on 5/17/18.
// Copyright (c) 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "NSDate+IPDateFormatters.h"

#define DATE_FORMAT @"dd MMMM, yyyy"

@implementation NSDate (IPDateFormatters)

const NSDateFormatter *_dateFormatter;

+ (const NSDateFormatter *)getDateFormatter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:DATE_FORMAT];
    });
    return _dateFormatter;
}

- (NSString *)getFormattedDate {
    return [[NSDate getDateFormatter] stringFromDate:self];
}

+ (instancetype)getDateFromFormattedString:(NSString *)formattedString {
    return [[NSDate getDateFormatter] dateFromString:formattedString];
}

@end
