//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZImageEditingViewController.h"
#import "DZImageHelper.h"

static CGFloat const scaleMultiplier = 3.0f;

@interface DZImageEditingViewController () <UIScrollViewDelegate>
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
    
    //scroll view content offset
    if (!CGRectEqualToRect(self.cropRect, CGRectZero)) {
        CGFloat bottom = self.view.bounds.size.height - self.cropRect.size.height - self.cropRect.origin.y;
        CGFloat right = self.view.bounds.size.width - self.cropRect.size.width - self.cropRect.origin.x;
        CGFloat top = self.cropRect.origin.y;
        CGFloat left = self.cropRect.origin.x;
        [self.scrollView setContentInset:UIEdgeInsetsMake(top, left, bottom, right)];
    }
    
    if (self.minimumScale) {
        self.scrollView.minimumZoomScale = self.minimumScale;
    } else {
        self.scrollView.minimumZoomScale = [DZImageHelper minimumScaleFromSize:self.image.size
                                                               toFitTargetSize:self.view.bounds.size];
    }

    if (self.maximumScale) {
        self.scrollView.maximumZoomScale = self.maximumScale;
    } else {
        self.scrollView.maximumZoomScale = self.scrollView.minimumZoomScale * scaleMultiplier;
    }

    if (self.defaultScale) {
        self.scrollView.zoomScale = self.defaultScale;
    } else {
        self.scrollView.zoomScale = self.minimumScale * scaleMultiplier / 2;
    }
    
    if (self.overlayView) {
        [self.view addSubview: self.overlayView];
    }
}

#pragma mark - actions

- (IBAction)cancelEditing
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.overlayView;
}

@end