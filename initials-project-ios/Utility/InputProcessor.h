//
//  InputProcessor.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/11/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputProcessor : NSObject

@property (nonatomic, readonly) NSArray<NSString *> *words;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, readonly) NSString* pattern;

- (instancetype)initWithPattern:(NSString *)pattern;
- (void)processInput:(NSString *)text;

@end
