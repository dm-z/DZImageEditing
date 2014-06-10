//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZImageEditingViewController.h"

@interface DZImageEditingViewController ()

@end

@implementation DZImageEditingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - actions

- (IBAction)cancelEditing
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end