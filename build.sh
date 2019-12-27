cd SimpleImageViewer
xcodebuild -target SimpleImageViewer -scheme SimpleImageViewer -sdk iphoneos -derivedDataPath builds ONLY_ACTIVE_ARCH=NO
xcodebuild -target SimpleImageViewer -scheme SimpleImageViewer -sdk iphonesimulator -derivedDataPath builds ONLY_ACTIVE_ARCH=NO

cp -r builds/Build/Products/Release-iphonesimulator/SimpleImageViewer.framework/Modules/SimpleImageViewer.swiftmodule/. builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/Modules/SimpleImageViewer.swiftmodule/

lipo -create -output SimpleImageViewer2 builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer builds/Build/Products/Release-iphonesimulator/SimpleImageViewer.framework/SimpleImageViewer
mv SimpleImageViewer2 builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework
rm builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer
mv builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer2 builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/SimpleImageViewer
sharpie bind -sdk iphoneos13.2 -namespace Xamarin.Bindings.SimpleImageViewer -scope builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/Headers builds/Build/Products/Release-iphoneos/SimpleImageViewer.framework/Headers/SimpleImageViewer-Swift.h

cd ..
nuget restore
msbuild /t:Rebuild /p:Configuration=Release Xamarin.Bindings.SimpleImageViewer/Xamarin.Bindings.SimpleImageViewer.csproj

mkdir -p _builds/SimpleImageViewer
cp Xamarin.Bindings.SimpleImageViewer/bin/Release/SimpleImageViewer*.dll _builds/SimpleImageViewer/
mv Xamarin.Bindings.SimpleImageViewer/bin/Release/Xamarin.Bindings.SimpleImageViewer.*.nupkg Xamarin.Bindings.SimpleImageViewer/bin/Release/Xamarin.Bindings.SimpleImageViewer.nupkg
cp Xamarin.Bindings.SimpleImageViewer/bin/Release/*.nupkg _builds/nugets
cp Xamarin.Bindings.SimpleImageViewer/bin/Release/*.nuspec _builds/nugets