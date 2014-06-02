//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DZImageEditingViewController : UIViewController
@property (retain, nonatomic) UIImage *image;
@property (retain, nonatomic) UIView *overlayView;
@property (nonatomic) CGRect cropRect;
@end