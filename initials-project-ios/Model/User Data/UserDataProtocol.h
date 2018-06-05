//
//  UserDataProtocol.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/5/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol UserDataProtocol <NSObject>

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSDate *creationDate;
@property (nonatomic, readonly) NSString *imagePath;

@end
