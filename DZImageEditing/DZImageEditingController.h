//
// Created by Dmitry Zozulya on 02.06.14.
// Copyright (c) 2014 Dmitry Zozulya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZImageEditingControllerDelegate.h"

@interface DZImageEditingController : UIViewController

//required
@property (retain, nonatomic) UIImage *image;

//optional
@property (retain, nonatomic) UIView *overlayView;
@property (nonatomic) CGRect cropRect;
@property (nonatomic) CGFloat defaultScale;
@property (nonatomic) CGFloat minimumScale;
@property (nonatomic) CGFloat maximumScale;
@property (nonatomic, weak) id <DZImageEditingControllerDelegate> delegate;
@end