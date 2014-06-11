//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZImageEditingController.h"
#import "DZImageHelper.h"
#import "DZImageEditingControllerDelegate.h"

@interface DZImageEditingController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) UIImageView *imageView;
@end

@implementation DZImageEditingController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //adding image to scrollView
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.image.size;
    self.scrollView.scrollEnabled = YES;

    [self setScrollViewOffset];
    [self setupMinimumScale];
    [self setupMaximumScale];
    [self setupDefaultScale];

    if (self.overlayView) {
        [self.view addSubview:self.overlayView];
    }
}

#pragma mark - actions

- (IBAction)cancelEditing
{
    [self.delegate imageEditingControllerDidCancel:self];
}

- (IBAction)endedEditing
{
    UIImage *croppedImage = [DZImageHelper cropImage:self.image
                                      fromScrollView:self.scrollView
                                            withSize:self.cropRect.size];
    [self.delegate imageEditingController:self
                didFinishEditingWithImage:croppedImage];
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
    }
    else {
        self.scrollView.minimumZoomScale = [DZImageHelper minimumScaleFromSize:self.image.size
                                                               toFitTargetSize:self.cropRect.size];
    }
    NSLog(@"minScale = %f", self.scrollView.minimumZoomScale);
}

- (void)setupMaximumScale
{
    if (self.maximumScale) {
        self.scrollView.maximumZoomScale = self.maximumScale;
    }
    else {
        self.scrollView.maximumZoomScale = 2 * [DZImageHelper minimumScaleFromSize:self.image.size
                                                                   toFitTargetSize:[UIScreen mainScreen].bounds.size];
    }
    NSLog(@"maxScale = %f", self.scrollView.maximumZoomScale);
}

- (void)setupDefaultScale
{
    if (self.defaultScale) {
        self.scrollView.zoomScale = self.defaultScale;
    }
    else {
        self.scrollView.zoomScale = 1.0f;
    }
    NSLog(@"scale = %f", self.scrollView.zoomScale);
}

- (void)setScrollViewOffset
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    if (! CGRectEqualToRect(self.cropRect, CGRectZero)) {
        CGFloat bottom = screenBounds.size.height - self.cropRect.size.height - self.cropRect.origin.y;
        CGFloat right = screenBounds.size.width - self.cropRect.size.width - self.cropRect.origin.x;
        CGFloat top = self.cropRect.origin.y;
        CGFloat left = self.cropRect.origin.x;
        [self.scrollView setContentInset:UIEdgeInsetsMake(top, left, bottom, right)];
    }
}

@end