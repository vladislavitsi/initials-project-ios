//
// Created by Uladzislau Kleshchanka on 5/20/18.
// Copyright (c) 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>

@interface MailHandler : MFMailComposeViewController <MFMailComposeViewControllerDelegate>

+ (instancetype)mailComposeViewControllerForImage:(UIImage *)image name:(NSString *)name;


@end