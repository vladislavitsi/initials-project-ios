//
//  MainControllerExamplesDelegate.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/18/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "MainControllerExamplesDelegate.h"
#import "ExamplePreviewViewController.h"

#define EXAMPLE_NAMES @[@"Sheldon Li Cooper", @"Luke Skywalker", @"Alex Di-Mango"]

#define EXAMPLE_IMAGES @[[UIImage imageNamed:@"SheldonLiCooperExample"], [UIImage imageNamed:@"LukeSkywalkerExample"], [UIImage imageNamed:@"AlexDiMangoExample"]]

@interface MainControllerExamplesDelegate () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *pages;

@end

@implementation MainControllerExamplesDelegate

- (void)start {
    UIPageViewController *viewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    viewController.delegate = self;
    viewController.dataSource = self;
    [viewController setViewControllers:@[self.pages.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"navigate.push" object:nil userInfo:@{@"destination":viewController}];
}

- (NSArray *)pages {
    if (_pages == nil) {
        NSMutableArray<ExamplePreviewViewController *> *pages = [NSMutableArray array];
        NSArray *names = EXAMPLE_NAMES;
        NSArray *images = EXAMPLE_IMAGES;
        int i = 0;
        for (NSString *name in names) {
            ExamplePreviewViewController *examplePreviewViewController = [[ExamplePreviewViewController alloc] initWithNibName:@"Preview" bundle:nil];
            examplePreviewViewController.name = name;
            examplePreviewViewController.image = images[i];
            [pages addObject:examplePreviewViewController];
            i++;
        }
        _pages = pages;
    }
    return _pages;
}

#pragma mark - PageView DataSource

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
//    return [self.pages indexOfObject:pageViewController];
    return 0;
}


@end
