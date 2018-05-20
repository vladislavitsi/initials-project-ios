//
//  GalleryDetailsViewController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 4/29/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "GalleryDetailsViewController.h"

@interface GalleryDetailsViewController ()

@end

@implementation GalleryDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
    [self.preview addSubview:imageView];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionSheet)];

    
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *array = @[
                       [imageView.leftAnchor constraintEqualToAnchor:self.preview.leftAnchor constant:0],
                       [imageView.topAnchor constraintEqualToAnchor:self.preview.topAnchor constant:0],
                       [imageView.rightAnchor constraintEqualToAnchor:self.preview.rightAnchor constant:0],
                       [imageView.bottomAnchor constraintEqualToAnchor:self.preview.bottomAnchor constant:0]
                       ];
    [NSLayoutConstraint activateConstraints:array];
}

- (void)actionSheet {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Save to Photos, Send via Email or Delete record." message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak GalleryDetailsViewController *weakSelf = self;

    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
        weakSelf.deleteElement(weakSelf.index);
    }];

    UIAlertAction *sendViaEmailAction = [UIAlertAction actionWithTitle:@"Send via Email" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        weakSelf.sendViaEmail(weakSelf.index);
    }];
    UIAlertAction *saveToPhotosAction = [UIAlertAction actionWithTitle:@"Save to Photos" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        weakSelf.saveToPhotos(weakSelf.index);
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

    [actionSheet addAction:deleteAction];
    [actionSheet addAction:sendViaEmailAction];
    [actionSheet addAction:saveToPhotosAction];
    [actionSheet addAction:cancelAction];

    [self presentViewController:actionSheet animated:YES completion:nil];
}




@end
