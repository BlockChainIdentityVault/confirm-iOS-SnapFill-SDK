# Confirm SnapFill SDK

Confirm.io's SnapFill SDK reads and parses data from state and federally issued identity documents for use in your application. Simply include the SDK into your application, insert your API key (provided by Confirm.io), and allow your app's users to start scanning their IDs! Once scanned the data can be used not only to populate forms, but also to trigger automatic onboarding, user identification, marketing campaigns, and more!

Confirm SnapFill supports a wide variety of document types including Driver Licenses, Identity documents, and more! In addition, Confirm SnapFill offers full coverage of documents issued by the United States. 

## Usage

Confirm's SnapFill SDK provides a singleton object called `SnapFill` that acts as the entry point to the framework's functionality.

### Configure

The first step is to authenticate the `SnapFill` object with the API key you received from [Confirm.io](http://confirm.io/). This will remove the watermark on the default scan UI, and also allow you to set your own custom scan overlay. You can do this by calling `configure:completion:` with your API key and optional completion block. We strongly recommend storing your API key in the `AppDelegate` implementation, rather than a property list, and calling `configure:` from `application:didFinishLaunchingWithOptions:`:

```objective-c
#import <ConfirmSnapFill/ConfirmSnapFill.h>

NSString *const SnapFillToken = @"{YOUR_API_KEY_HERE}";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [[SnapFill sharedInstance] configure:SnapFillTokenToken completion:nil];
    …
}

@end
```

### Scan

To initiate a scan, you must present a `CSFScanViewController` onto the view hierarchy. The easiest way to initialize and present a `CSFScanViewController` from another view controller is as follows:

```objective-c
#import <ConfirmSnapFill/ConfirmSnapFill.h>

@implementation MyViewController

- (IBAction)beginScan {
  CSFScanViewController *scanViewController = [[SnapFill sharedInstance] scanLicenseWithCompletion:^(CSFIdModel *license) {
    // Dismiss scanViewController
    // Handle ID information stored in `license`
  }];

  [self presentViewController:scanViewController animated:true completion:nil];
}

@end
```

This will present the camera view with the default scanner UI overlaid. When the scanner detects the correct type of barcode (PDF417), it will automatically scan it and call the completion block. Make sure to dismiss the scanner from the completion block.

### Respond to scan

As you may have noticed above, we passed a completion block when we initialized the `CSFScanViewController`. This completion block takes a `CSFIdModel` as its input. That model contains all of the personal information stored in the barcode that was just scanned.

### Using CSFScannerDelegate

Instead of using a completion block, you may choose to implement the `CSFScannerDelegate` protocol manually. See the example below. 

```objective-c
#import <ConfirmSnapFill/ConfirmSnapFill.h>

@interface MyViewController () <CSFScannerDelegate>
@end

@implementation MyViewController

- (IBAction)beginScan {
  CSFScanViewController *scanViewController = [CSFScanViewController new];
  scanViewController.delegate = self;

  [self presentViewController:scanViewController animated:true completion:nil];
}

- (void)didScanLicense:(CSFIdModel *)license {
  // Dismiss view controller
  // Handle ID information stored in `license`
}

@end
```

### Customizing the overlay

If you'd like to use something other than the default scan view overlay, you may manually set the `overlayView` property on `CSFScanViewController`, as in the example below:

```objective-c
CSFScanViewController *scanViewController = [CSFScanViewController new];
scanViewController.overlayView = [MyOverlayView new];
```

If you don't see the overlay view changing, ensure first that the library is properly authenticated. A message will also be logged out if you attempt to call `setOverlayView:` before authenticating.

## Building and running the example on the device

There is a [sample project](https://github.com/confirm-io/ios-ageverify-demo/tree/master/ConfirmKitExample) included in this repository that acts as a good reference for your own implementation.


1. Select `SnapFillExample` as the active scheme and ensure you are building for **device (you cannot run this on the simulator)**
2. Use <kbd>Cmd</kbd>+<kbd>R</kbd> to build and run the demo app.