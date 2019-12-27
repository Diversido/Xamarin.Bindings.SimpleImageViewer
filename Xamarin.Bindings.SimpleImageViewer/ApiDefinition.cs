using System;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace Xamarin.Bindings.SimpleImageViewer
{
	// @interface ImageViewerConfiguration : NSObject
	[BaseType (typeof (NSObject))]
	[DisableDefaultCtor]
	interface ImageViewerConfiguration
	{
		// @property (nonatomic, strong) UIImage * _Nullable image;
		[NullAllowed, Export ("image", ArgumentSemantic.Strong)]
		UIImage Image { get; set; }

		// @property (nonatomic, strong) UIImageView * _Nullable imageView;
		[NullAllowed, Export ("imageView", ArgumentSemantic.Strong)]
		UIImageView ImageView { get; set; }

		// -(instancetype _Nonnull)initWithConfigurationClosure:(void (^ _Nonnull)(ImageViewerConfiguration * _Nonnull))configurationClosure __attribute__((objc_designated_initializer));
		[Export ("initWithConfigurationClosure:")]
		[DesignatedInitializer]
		IntPtr Constructor (Action<ImageViewerConfiguration> configurationClosure);

		// +(instancetype _Nonnull)new __attribute__((deprecated("-init is unavailable")));
		[Static]
		[Export ("new")]
		ImageViewerConfiguration New ();
	}

	// @interface ImageViewerController : UIViewController <UIGestureRecognizerDelegate, UIScrollViewDelegate>
	[BaseType (typeof (UIViewController))]
	interface ImageViewerController : IUIGestureRecognizerDelegate, IUIScrollViewDelegate
	{
		// @property (readonly, nonatomic) BOOL prefersStatusBarHidden;
		[Export ("prefersStatusBarHidden")]
		bool PrefersStatusBarHidden { get; }

		// -(instancetype _Nonnull)initWithConfiguration:(ImageViewerConfiguration * _Nullable)configuration __attribute__((objc_designated_initializer));
		[Export ("initWithConfiguration:")]
		[DesignatedInitializer]
		IntPtr Constructor ([NullAllowed] ImageViewerConfiguration configuration);

		// -(instancetype _Nullable)initWithCoder:(NSCoder * _Nonnull)aDecoder __attribute__((objc_designated_initializer));
		//[Export ("initWithCoder:")]
		//[DesignatedInitializer]
		//IntPtr Constructor (NSCoder aDecoder);

		// -(void)viewDidLoad;
		[Export ("viewDidLoad")]
		void ViewDidLoad ();

		// -(UIView * _Nullable)viewForZoomingInScrollView:(UIScrollView * _Nonnull)scrollView __attribute__((warn_unused_result));
		[Export ("viewForZoomingInScrollView:")]
		[return: NullAllowed]
		UIView ViewForZoomingInScrollView (UIScrollView scrollView);

		// -(void)scrollViewDidZoom:(UIScrollView * _Nonnull)scrollView;
		[Export ("scrollViewDidZoom:")]
		void ScrollViewDidZoom (UIScrollView scrollView);

		// -(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer * _Nonnull)gestureRecognizer __attribute__((warn_unused_result));
		[Export ("gestureRecognizerShouldBegin:")]
		bool GestureRecognizerShouldBegin (UIGestureRecognizer gestureRecognizer);
	}
}
