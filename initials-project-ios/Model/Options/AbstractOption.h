//
//  AbstractOption.h
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/13/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractOption : NSObject

@property (nonatomic, copy) NSString *name;

+ (instancetype)fromJSONDictionary:(NSDictionary *)jsonDictionary;

@end
