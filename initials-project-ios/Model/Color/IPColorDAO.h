//
//  IPColorDAO.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPColor.h"
#import "AbstractOptionDAO.h"

@interface IPColorDAO : AbstractOptionDAO

- (instancetype)initWithPath:(NSString *)path;

@end
