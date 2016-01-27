# ConfirmKit for iOS

ConfirmKit is a framework that makes it easy to extract personal information from your users' via the barcode found on the back of most U.S. and Canadian driver's licenses.

## Usage

ConfirmKit provides a singleton object called `Confirm` that acts as the entry point to the framework's functionality.

### Configure

The first step is to authenticate the `Confirm` object with the API key you received from [Confirm.io](http://confirm.io/). This will remove the watermark on the default scan UI, and also allow you to set your own, custom scan overlay. You can do this by calling `configure:completion:` with your API key and optional completion block. We strongly recommend storing your API key in the `AppDelegate` implementation, rather than a property list, and calling `configure:` from `application:didFinishLaunchingWithOptions:`:

```objective-c
#import <ConfirmKit/ConfirmKit.h>

NSString *const ConfirmToken = @"d8e756c3-7542-4254-b453-9c8a34f0e77c";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [[Confirm sharedInstance] configure:ConfirmToken completion:nil];
    …
}

@end
```

### Scan

To initiate a scan, you must present a `CKScanViewController` onto the view hierarchy. The easiest way to initialize and present a `CKScanViewController` from another view controller is as follows:

```objective-c
#import <ConfirmKit/ConfirmKit.h>

@implementation MyViewController

- (IBAction)beginScan {
  CKScanViewController *scanViewController = [[Confirm sharedInstance] scanLicenseWithCompletion:^(CKIdModel *license) {
    // Dismiss scanViewController
    // Handle ID information stored in `license`
  }];

  [self presentViewController:scanViewController animated:true completion:nil];
}

@end
```

This will present the camera view with the default scanner UI overlaid. When the scanner detects the correct type of barcode (PDF417), it will automatically scan it and call the completion block. Make sure to dismiss the scanner from the completion block.

### Respond to scan

As you may have noticed above, we passed a completion block when we initialized the `CKScanViewController`. This completion block takes a `CKIdModel` as its input. That model contains all of the personal information stored in the barcode that was just scanned.

### Using CKScannerDelegate

Instead of using a completion block, you may choose to implement the `CKScannerDelegate` protocol manually. See the example below. 

```objective-c
#import <ConfirmKit/ConfirmKit.h>

@interface MyViewController () <CKScannerDelegate>
@end

@implementation MyViewController

- (IBAction)beginScan {
  CKScanViewController *scanViewController = [CKScanViewController new];
  scanViewController.delegate = self;

  [self presentViewController:scanViewController animated:true completion:nil];
}

- (void)didScanLicense:(CKIdModel *)license {
  // Dismiss view controller
  // Handle ID information stored in `license`
}

@end
```

### Customizing the overlay

If you'd like to use something other than the default scan view overlay, you may manually set the `overlayView` property on `CKScanViewController`, as in the example below:

```objective-c
CKScanViewController *scanViewController = [CKScanViewController new];
scanViewController.overlayView = [MyOverlayView new];
```

If you don't see the overlay view changing, ensure first that the library is properly authenticated. A message will also be logged out if you attempt to call `setOverlayView:` before authenticating.

## Example

There is a [sample project](https://github.com/confirm-io/ios-ageverify-demo/tree/master/ConfirmKitExample) included in this repository that acts as a good reference for your own implementation.
