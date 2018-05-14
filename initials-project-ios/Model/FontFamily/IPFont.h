//
//  IPFont.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "AbstractOption.h"

@interface IPFont : AbstractOption

@property (nonatomic, copy) NSString *fontName;

- (instancetype)initWithName:(NSString *)name fontName:(NSString *)fontName;

@end
