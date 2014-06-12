//
// Created by Dmitry Zozulya on 12.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZHackedImagePickerController.h"

@interface DZHackedImagePickerController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@end

@implementation DZHackedImagePickerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([navigationController.viewControllers indexOfObject:viewController] == 2)
    {
        [self.view addSubview:self.overlayView];
    } else {
        [self.overlayView removeFromSuperview];
    }
}

@end