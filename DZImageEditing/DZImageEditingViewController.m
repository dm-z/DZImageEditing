//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZImageEditingViewController.h"
#import "DZImageHelper.h"

@interface DZImageEditingViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) UIImageView *imageView;
@end

@implementation DZImageEditingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //adding image to scrollView
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    [self.scrollView addSubview:self.imageView];
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
    
    [self setupMinimumScale];
    [self setupMaximumScale];
    [self setupDefaultScale];
    
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
    return self.imageView;
}

#pragma mark - private

- (void)setupMinimumScale
{
    if (self.minimumScale) {
        self.scrollView.minimumZoomScale = self.minimumScale;
    } else {
        self.scrollView.minimumZoomScale = [DZImageHelper minimumScaleFromSize:self.image.size
                                                               toFitTargetSize:self.cropRect.size];
    }
    NSLog(@"minScale = %f", self.scrollView.minimumZoomScale);
}

- (void)setupMaximumScale
{
    if (self.maximumScale) {
        self.scrollView.maximumZoomScale = self.maximumScale;
    } else {
        self.scrollView.maximumZoomScale = 2 * [DZImageHelper minimumScaleFromSize:self.image.size
                                                                   toFitTargetSize:self.view.bounds.size];
    }
    NSLog(@"maxScale = %f", self.scrollView.maximumZoomScale);
}

- (void)setupDefaultScale
{
    if (self.defaultScale) {
        self.scrollView.zoomScale = self.defaultScale;
    } else {
        self.scrollView.zoomScale = self.scrollView.maximumZoomScale / 2;
    }
    NSLog(@"scale = %f", self.scrollView.zoomScale);
}

@end