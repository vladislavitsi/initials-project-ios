//
//  IPFont.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/14/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "AbstractOption.h"

@interface IPFont : AbstractOption

@property (nonatomic, copy, nonnull) NSString *fontName;

- (instancetype  _Nonnull )initWithName:(NSString *_Nonnull)name fontName:(NSString *_Nonnull)fontName;

@end
