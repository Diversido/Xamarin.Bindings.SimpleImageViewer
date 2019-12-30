# Xamarin.Bindings.SimpleImageViewer

There is a Xamarin bindings for SimpleImageViewer iOS library by aFrogleap
https://github.com/aFrogleap/SimpleImageViewer

Nuget is available: https://www.nuget.org/packages/Xamarin.Bindings.SimpleImageViewer/

Usage is similar to the native one:
```
var configuration = new ImageViewerConfiguration ((ImageViewerConfiguration obj) =>
{
// imageView is an actual UIImageView with the image to open full screen
// might be used as obj.Image = image instead, though transitions won't 
// work in this case
  obj.ImageView = imageView;
});
var imageViewController = new ImageViewerController (configuration);
PresentViewController (imageViewController, true, null);
```

