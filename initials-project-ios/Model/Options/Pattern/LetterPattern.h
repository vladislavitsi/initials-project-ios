//
//  LetterPattern.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/2/18.
//  Copyright © 2018 Vladislav Kleschenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LetterPattern : NSObject

@property (nonatomic, readonly) NSInteger size;
@property (nonatomic, readonly) NSInteger x;
@property (nonatomic, readonly) NSInteger y;

- (instancetype _Nonnull)initWithX:(NSInteger)x y:(NSInteger)y size:(NSInteger)size;

+ (instancetype _Nullable)fromDictionary:(NSDictionary *_Nonnull)dictionary;
@end
