//
// Created by Uladzislau Kleshchanka on 5/20/18.
// Copyright (c) 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MailHandler.h"


@implementation MailHandler



- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }

    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

+ (instancetype)mailComposeViewControllerForImage:(UIImage *)image name:(NSString *)name {
    MailHandler *mailCont = [[MailHandler alloc] init];
    mailCont.mailComposeDelegate = mailCont;

    [mailCont setSubject:@"Handkr. Initials image"];
    [mailCont setMessageBody:name isHTML:NO];
    [mailCont addAttachmentData:(NSData *)UIImagePNGRepresentation(image) mimeType:(NSString *)@"image/png" fileName:(NSString *)@"initialsImage"];
    return mailCont;
}


@end