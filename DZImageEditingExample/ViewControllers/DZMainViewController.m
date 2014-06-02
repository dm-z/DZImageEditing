//
//  DZMainViewController.m
//  DZImageEditing
//
//  Created by Dmitry Zozulya on 02.06.14.
//  Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import "DZMainViewController.h"

@interface DZMainViewController ()
@property (retain, nonatomic) UIImagePickerController *pickerController;
@end

@implementation DZMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)standardImagePicker
{
    UIImagePickerController *pickerController = [UIImagePickerController new];
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.allowsEditing = YES;
    [self presentViewController:pickerController
                       animated:YES
                     completion:nil];
}


@end