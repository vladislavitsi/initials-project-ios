//
//  ExamplesPagesViewController.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 4/29/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "ExamplesPagesViewController.h"
#import "GalleryDetailsViewController.h"

@interface ExamplesPagesViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, copy) NSArray *pages;

@end

@implementation ExamplesPagesViewController


- (NSArray *)getViewControllers {
    return @[
             [[GalleryDetailsViewController alloc] initWithNibName:@"GalleryDetailsViewController" bundle:nil],
             [[GalleryDetailsViewController alloc] initWithNibName:@"GalleryDetailsViewController" bundle:nil],
             [[GalleryDetailsViewController alloc] initWithNibName:@"GalleryDetailsViewController" bundle:nil]
             ];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.pages = [self getViewControllers];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.delegate = self;
    self.dataSource = self;
    self.navigationItem.backBarButtonItem.title = @"Home";
    [self setViewControllers:@[self.pages.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPageViewControllerDataSource

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self.pages indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return self.pages[index - 1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self.pages indexOfObject:viewController];
    if (index == self.pages.count - 1) {
        return nil;
    }
    return self.pages[index + 1];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.pages.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

@end
