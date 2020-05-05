# Xamarin.Bindings.SimpleImageViewer

This is a Xamarin bindings for SimpleImageViewer iOS library by aFrogleap
https://github.com/aFrogleap/SimpleImageViewer

The original iOS library can not be used as-is, and we have to make a few modifications.
The modified library can be found here:
https://github.com/Diversido/SimpleImageViewer/tree/modification-for-xamarin-bindings

## NuGet

Nuget is available: https://www.nuget.org/packages/Xamarin.Bindings.SimpleImageViewer/

## Usage

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

# Contribution Guide

## Prepare

1. Ensure `sharpie` installed: https://docs.microsoft.com/en-us/xamarin/cross-platform/macios/binding/objective-sharpie/get-started

2. Open `build.sh` and update `IOS_SDK` property to match system SDK

## Run

`sh build.sh`

## Check

1. Ensure DLL is created
2. Ensure nuget files are created
