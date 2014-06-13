DZImageEditing
==============
DZImageEditing is lightweight replacement for UIImagePickerController editing mode (support overlay, custom crop etc.)

Original **UIImagePickerController** editing mode have a lot of limitations:
 - you can't add custom min/max zoomScale
 - you can't add overlay for better positioning
 - you can't give user opportunity to move image borders to the center of the screen
 - you need to do all cropping work by yourself

With **DZImageEditing** you can:
 - setup minimum, maximum and default zoomScale value
 - add custom overlay view
 - select crop rect, so you'll get only area that you need
 - move/scale your image in a way you need it without limitations

![Demo](https://raw.githubusercontent.com/DZozulya/DZImageEditing/master/DemoGifs/DZImageEditing.gif)

## Using
Import 'DZImageEditingController.h'
```objective-c
#import "DZImageEditingController.h"
```

Init **DZImageEditing** with 'alloc' 'init', and set parameters:
```objective-c
DZImageEditingController *editingViewController = [DZImageEditingController new];
//required
editingViewController.image = image;
//optional
editingViewController.overlayView = overlayImageView;
editingViewController.cropRect = frameRect;
editingViewController.delegate = self;
editingViewController.minimumScale = 1.0f;
editingViewController.maximumScale = 2.0f;
editingViewController.defaultScale = 1.5f;
```
The only required parameter is 'image', all others are optional, and will be set automatically to default values.

**DZImageEditingControllerDelegate** got two optional methods:

For cropped image
```objective-c
- (void)imageEditingController:(DZImageEditingController *)editingController
     didFinishEditingWithImage:(UIImage *)editedImage;
```

If user canceled editing
```objective-c
- (void)imageEditingControllerDidCancel:(DZImageEditingController *)editingController;
```

## Requirements
- iOS >= 7.0 (may work on iOS6, but will need light design changes)
- ARC
