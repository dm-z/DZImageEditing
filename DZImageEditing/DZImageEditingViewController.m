//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZImageEditingViewController.h"

@interface DZImageEditingViewController ()
@property (weak, nonatomic) IBOutlet UIView *overlay;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation DZImageEditingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
    [self.scrollView addSubview:imageView];
    self.scrollView.contentSize = self.image.size;
    self.scrollView.scrollEnabled = YES;
    
    self.overlay = self.overlayView;
}

#pragma mark - actions

- (IBAction)cancelEditing
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end