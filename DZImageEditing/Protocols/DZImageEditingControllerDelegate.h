//
// Created by Dmitry Zozulya on 11.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DZImageEditingController;

@protocol DZImageEditingControllerDelegate <NSObject>

@optional
- (void)imageEditingControllerDidCancel:(DZImageEditingController *)editingController;
- (void)imageEditingController:(DZImageEditingController *)editingController
     didFinishEditingWithImage:(UIImage *)editedImage;
@end