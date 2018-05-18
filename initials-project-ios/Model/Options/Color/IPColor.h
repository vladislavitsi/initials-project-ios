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

@property (nonatomic, readonly) UIColor *color;

- (instancetype)initWithName:(NSString *)name color:(UIColor *)color;

+ (instancetype)fromJSONDictionary:(NSDictionary *)jsonDictionary;

@end
