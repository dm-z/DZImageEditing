//
//  DZMainViewController.m
//  DZImageEditing
//
//  Created by Dmitry Zozulya on 02.06.14.
//  Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZMainViewController.h"
#import "DZImageEditingViewController.h"

@interface DZMainViewController () <UIImagePickerControllerDelegate>
@property (retain, nonatomic) UIImagePickerController *pickerController;
@property (retain, nonatomic) UIImageView *overlayImageView;
@property (nonatomic) CGRect frameRect;
@end

@implementation DZMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *overlayImage = [UIImage imageNamed:@"overlay200"];
    self.overlayImageView = [self createOverlayImageViewWithImage:overlayImage];
    self.overlayImageView.image = overlayImage;
}

#pragma mark - actions

- (IBAction)standardImagePicker
{
    UIImagePickerController *pickerController = [UIImagePickerController new];
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.allowsEditing = YES;
    [self presentViewController:pickerController
                       animated:YES
                     completion:nil];
}

- (IBAction)advancedImagePicker
{
    UIImagePickerController *pickerController = [UIImagePickerController new];
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.delegate = self;
    [self presentViewController:pickerController
                       animated:YES
                     completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:NO completion:^{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        DZImageEditingViewController *editingViewController = [DZImageEditingViewController new];
        editingViewController.image = image;
        editingViewController.overlayView = self.overlayImageView;
        editingViewController.cropRect = self.frameRect;

        [self presentViewController:editingViewController
                           animated:YES
                         completion:nil];
    }];
}

#pragma mark - private

- (UIImageView *)createOverlayImageViewWithImage:(UIImage *)image
{
    CGFloat newX = self.view.bounds.size.width / 2 - image.size.width / 2;
    CGFloat newY = self.view.bounds.size.height / 2 - image.size.height / 2;
    self.frameRect = CGRectMake(newX, newY, image.size.width, image.size.height);
    return [[UIImageView alloc] initWithFrame:self.frameRect];
}

@end