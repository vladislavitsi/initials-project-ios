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
//    self.preview.clipsToBounds = YES;
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
@end
