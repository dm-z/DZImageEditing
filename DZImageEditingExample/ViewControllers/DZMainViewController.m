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
@end

@implementation DZMainViewController

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

        [self presentViewController:editingViewController
                           animated:YES
                         completion:nil];
    }];
}

@end