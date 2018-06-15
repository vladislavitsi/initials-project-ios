//
//  IPColor.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AbstractOption.h"

@interface IPColor : AbstractOption

@property (nonatomic, readonly, nonnull) UIColor *color;

- (instancetype _Nonnull)initWithName:(NSString * _Nonnull)name color:( UIColor * _Nonnull )color;

+ (instancetype _Nullable)fromJSONDictionary:(NSDictionary * _Nonnull)jsonDictionary;

@end
