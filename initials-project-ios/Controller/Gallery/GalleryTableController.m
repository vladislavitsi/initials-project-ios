//
//  GalleryTableController.m
//  initials-project-ios
//
//  Created by Vladislav Kleschenko on 5/15/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "GalleryTableController.h"
#import "GalleryTableViewCell.h"
#import "GalleryDetailsViewController.h"
#import "IPFileManager.h"
#import "NSDate+IPDateFormatters.h"
#import "MailHandler.h"
#import "Constants.h"

@implementation GalleryTableController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GalleryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GalleryTableViewCell" forIndexPath:indexPath];
    id<UserDataProtocol> userData = [self.dataSource getDataForIndex:indexPath.row];
    cell.imagePreview.image = [IPFileManager getImageForPath:userData.imagePath];
    cell.dataLabel.text = [userData.creationDate getFormattedDate];
    cell.nameLabel.text = userData.name;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataSource removeUserDataForIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GalleryDetailsViewController *detailViewController = [[GalleryDetailsViewController alloc] initWithNibName:@"Preview" bundle:nil];
    detailViewController.title = @"Preview";
    
    id<UserDataProtocol> userData = [self.dataSource getDataForIndex:indexPath.row];
    UIImage *image = [IPFileManager getImageForPath:userData.imagePath];
    // Pass the selected object to the new view controller.
    detailViewController.name = userData.name;
    detailViewController.image = image;
    detailViewController.index = indexPath.row;
    
    __weak GalleryTableController *weakSelf = self;
    detailViewController.deleteElement = ^(NSInteger i) {
        [weakSelf tableView:tableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
    };

    detailViewController.saveToPhotos = ^(NSInteger i) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            UIImageWriteToSavedPhotosAlbum(image, weakSelf, @selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:), nil);
        });
    };

    detailViewController.sendViaEmail = ^(NSInteger i) {
        if([MFMailComposeViewController canSendMail]) {
            MailHandler *mailHandler = [MailHandler mailComposeViewControllerForImage:image name:userData.name];
            NSDictionary *userInfo = @{
                NOTIFICATION_USER_INFO_DESTINATION:mailHandler
            };
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAVIGATION_PRESENT object:nil userInfo:userInfo];
        }
    };
    
    // Push the view controller;
    NSDictionary *userInfo = @{
        NOTIFICATION_USER_INFO_DESTINATION:detailViewController
                               };
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAVIGATION_PUSH object:nil userInfo:userInfo];
}

- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void *)ctxInfo {
    NSString *message;
    if (error) {
        message = @"Unfortunately, save failed :(";
    } else {
        message = @"Saved successfully :)";
    }
    UIAlertController *infoAlert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [infoAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    NSDictionary *userInfo = @{
        NOTIFICATION_USER_INFO_DESTINATION:infoAlert
    };
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAVIGATION_PRESENT object:nil userInfo:userInfo];
}


@end
