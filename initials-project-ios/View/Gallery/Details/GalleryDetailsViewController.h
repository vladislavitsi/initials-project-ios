//
//  GalleryDetailsViewController.h
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 4/29/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractPreviewViewController.h"

@interface GalleryDetailsViewController : AbstractPreviewViewController

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) void (^deleteElement)(NSInteger i);
@property (nonatomic, copy) void (^saveToPhotos)(NSInteger i);
@property (nonatomic, copy) void (^sendViaEmail)(NSInteger i);
@end
