//
//  IPColor.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IPColor : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) UIColor *color;

- (instancetype)initWithName:(NSString *)name color:(UIColor *)color;

+ (instancetype)fromJSONDictionary:(NSDictionary *)jsonDictionary;

@end
