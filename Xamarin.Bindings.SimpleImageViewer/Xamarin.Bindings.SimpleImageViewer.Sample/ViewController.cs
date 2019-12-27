using Foundation;
using System;
using UIKit;
using CoreGraphics;

namespace Xamarin.Bindings.SimpleImageViewer.Sample
{
	public partial class ViewController : UIViewController
	{
		public ViewController (IntPtr handle) : base (handle)
		{
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			// Perform any additional setup after loading the view, typically from a nib.
			var button = new UIButton (new CGRect (150, 150, 60, 40));
			button.SetTitle ("Image", UIControlState.Normal);
			button.BackgroundColor = UIColor.Red;
			button.SetTitleColor (UIColor.Black, UIControlState.Normal);
			var imageView = new UIImageView (new CGRect(0, 200, 300, 300))
			{
				Image = new UIImage ("CNV000017.JPG"),
				ContentMode = UIViewContentMode.ScaleAspectFit
			};
			View.AddSubview (button);

			View.AddSubview (imageView);
			button.TouchUpInside += (sender, e) =>
			{
				
				var configuration = new ImageViewerConfiguration ((ImageViewerConfiguration obj) =>
				{
					obj.ImageView = imageView;
				});
				var imageViewController = new ImageViewerController (configuration);
				var subviews = imageViewController.View.Subviews;
				PresentViewController (imageViewController, true, null);
			};
		}

		public override void ViewDidAppear (bool animated)
		{
			base.ViewDidAppear (animated);

		}

		public override void DidReceiveMemoryWarning ()
		{
			base.DidReceiveMemoryWarning ();
			// Release any cached data, images, etc that aren't in use.
		}
	}
}