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
    [self setViewControllers:[self getViewControllers] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIPageViewControllerDataSource

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [[self viewControllers] indexOfObject:pageViewController];
    if (index == 0) {
        return nil;
    }
    return [self viewControllers][index - 1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [[self viewControllers] indexOfObject:pageViewController];
    if (index == self.viewControllers.count - 1) {
        return nil;
    }
    return [self viewControllers][index + 1];
}

@end
