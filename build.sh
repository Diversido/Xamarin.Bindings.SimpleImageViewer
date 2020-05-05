#!/bin/bash
# TODO
# 1. Ensure to use the latest sharpie (the latest version that worked is 3.4.0)
# 2. Use the SDK version installed on your machine (the latest version that worked 13.2)
IOS_SDK=iphoneos13.4

# Build native library
cd SimpleImageViewer
xcodebuild -target SimpleImageViewer -scheme SimpleImageViewer -configuration Release -sdk iphoneos -derivedDataPath builds ONLY_ACTIVE_ARCH=NO
xcodebuild -target SimpleImageViewer -scheme SimpleImageViewer -configuration Release -sdk iphonesimulator -derivedDataPath builds ONLY_ACTIVE_ARCH=NO

cp -r builds/Build/Products/Release-iphonesimulator/SimpleImageViewer.framework/Modules/SimpleImageViewer.swiftmodule/. builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/Modules/SimpleImageViewer.swiftmodule/

# Create fat library
lipo -create -output SimpleImageViewer2 builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer builds/Build/Products/Release-iphonesimulator/SimpleImageViewer.framework/SimpleImageViewer
mv SimpleImageViewer2 builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework
rm builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer
mv builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer2 builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer

# Sharpify
sharpie bind -sdk $IOS_SDK -namespace Xamarin.Bindings.SimpleImageViewer -scope builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/Headers builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/Headers/SimpleImageViewer-Swift.h

# Build Xamarin library
cd ..
#nuget restore
msbuild /t:Rebuild /p:Configuration=Release Xamarin.Bindings.SimpleImageViewer/Xamarin.Bindings.SimpleImageViewer.csproj

# Prepare nuget files
mkdir -p _builds/SimpleImageViewer
cp Xamarin.Bindings.SimpleImageViewer/bin/Release/SimpleImageViewer*.dll _builds/SimpleImageViewer/
mv Xamarin.Bindings.SimpleImageViewer/bin/Release/Xamarin.Bindings.SimpleImageViewer.*.nupkg Xamarin.Bindings.SimpleImageViewer/bin/Release/Xamarin.Bindings.SimpleImageViewer.nupkg
cp Xamarin.Bindings.SimpleImageViewer/bin/Release/*.nupkg _builds/nugets
cp Xamarin.Bindings.SimpleImageViewer/bin/Release/*.nuspec _builds/nugets

# Verify
lipo -info SimpleImageViewer/builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer
