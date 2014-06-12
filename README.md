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

Version
----
1.0
