//
//  PatternDAO.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/4/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Pattern;

@interface PatternDAO : NSObject

@property (nonatomic, readonly) NSArray<Pattern *> *patterns;

//+ (instancetype)shared;

@end
