DZImageEditing
==============
DZImageEditing is lightweight replacement for UIImagePickerController editing mode (support overlay, custom crop etc.)

**Original UIImagePickerController** have a lot of limitations:
 - you can't add custom min/max zoomScale
 - you can't add overlay for better positioning
 - you can't give user opportunity to move image borders to the center of the screen

![Demo](https://raw.githubusercontent.com/DZozulya/DZImageEditing/master/DemoGifs/Original.gif)

Using a hack you can add **overlay to standard UIImagePickerController**, but you have to be it's delegate and add/remove custom overlay view everytime 'navigationController:willShowViewController' is called. That leaves you with other problems:
 - you can't add custom min/max zoomScale
 - you can't give user opportunity to move image borders to the center of the screen
 - you need to do all work for cropping image in overlay position

![Demo](https://raw.githubusercontent.com/DZozulya/DZImageEditing/master/DemoGifs/OriginalHack.gif)

With **DZImageEditing** you can:
 - setup minimum, maximum and default zoomScale value
 - add custom overlay view
 - select crop rect, so you'll get only area that you need
 - move/scale your image in a way you need it without limitations

![Demo](https://raw.githubusercontent.com/DZozulya/DZImageEditing/master/DemoGifs/DZImageEditing.gif)

## Using
Init **DZImageEditing** with 'alloc' 'init', and set parameters:
```objective-c
DZImageEditingController *editingViewController = [DZImageEditingController new];
editingViewController.image = image;
editingViewController.overlayView = overlayImageView;
editingViewController.cropRect = frameRect;
editingViewController.delegate = self;
editingViewController.minimumScale = 1.0f;
editingViewController.maximumScale = 2.0f;
editingViewController.defaultScale = 1.5f;
```
The only required parameter is 'image', all others are optional, and will be setted automaticaly to default values.

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

##Version
1.0.0

## License
DZImageEditing is available under the MIT license. See the LICENSE file for more info.
