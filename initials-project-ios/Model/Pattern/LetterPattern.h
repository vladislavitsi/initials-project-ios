//
//  LetterPattern.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/2/18.
//  Copyright © 2018 Vladislav Kleschenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LetterPattern : NSObject

@property (nonatomic, readonly) NSInteger x;
@property (nonatomic, readonly) NSInteger y;

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y;

+ (instancetype)fromDictionary:(NSDictionary *)dictionary;
@end
