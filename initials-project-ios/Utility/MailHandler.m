//
// Created by Uladzislau Kleshchanka on 5/20/18.
// Copyright (c) 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MailHandler.h"

#define MAIL_SUBJECT @"Handkr. Initials image"
#define MIME_TYPE_IMAGE @"image/png"
#define MAIN_DEFAULT_FILE_NAME @"initialsImage"

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

    [mailCont setSubject:MAIL_SUBJECT];
    [mailCont setMessageBody:name isHTML:NO];
    [mailCont addAttachmentData:(NSData *)UIImagePNGRepresentation(image) mimeType:(NSString *)MIME_TYPE_IMAGE fileName:(NSString *)MAIN_DEFAULT_FILE_NAME];
    return mailCont;
}


@end
