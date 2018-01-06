# Confirm SnapFill SDK

Confirm.io's SnapFill SDK reads and parses data from state and federally issued identity documents for use in your application. Simply include the SDK into your application, insert your API key (provided by Confirm.io), and allow your app's users to start scanning their IDs! Once scanned the data can be used not only to populate forms, but also to trigger automatic onboarding, user identification, marketing campaigns, and more!

Confirm SnapFill supports a wide variety of document types including Driver Licenses, Identity documents, and more! In addition, Confirm SnapFill offers full coverage of documents issued by the United States. 

## Usage

Confirm's SnapFill SDK provides a singleton object called `SnapFill` that acts as the entry point to the framework's functionality.

## Installation

There are two ways to incorporate the SDK into your existing project.

**Using A Release Snapshot**
Download a zip from [the repository releases](https://github.com/confirm-io/confirm-iOS-SnapFill-SDK/releases) or grab the zip of the current master. This method also provides a sample. See the last section of this README for choosing the correct SDK configuration and running the sample.

**Using CocoaPods**
To add the SDK with CocoaPods, add these lines to your Podfile:

  `pod 'ConfirmSnapFillDebug', :configurations => ['Debug']`
  
  `pod 'ConfirmSnapFill', :configurations => ['Release']`

*[See this article](https://guides.cocoapods.org/using/using-cocoapods.html) for more information on using CocoaPods.*


### Configure

The first step is to authenticate the `SnapFill` object with the API key you received from [Confirm.io](http://confirm.io/). You can do this by calling `setAPIKey:` with your provided API key. We strongly recommend storing your API key in the `AppDelegate` implementation, rather than a property list, and calling `configure:` from `application:didFinishLaunchingWithOptions:`:

```objective-c
#import <ConfirmSnapFill/ConfirmSnapFill.h>

NSString *const SnapFillKey = @"{YOUR_API_KEY_HERE}";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [SnapFill.sharedInstance setAPIKey:ConfirmSnapFillAPIKey];

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

### Respond To Scan

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

### Customizing The Overlay

If you'd like to use something other than the default scan view overlay, you may manually set the `overlayView` property on `CSFScanViewController`, as in the example below:

```objective-c
CSFScanViewController *scanViewController = [CSFScanViewController new];
scanViewController.overlayView = [MyOverlayView new];
```

If you don't see the overlay view changing, ensure first that the library is properly authenticated. A message will also be logged out if you attempt to call `setOverlayView:` before authenticating.

## Choosing The Correct SDK Configuration

There are two SDK framework configurations supplied. They are contained within their respective folders:
- `Debug` - This framework can be used with both the device and simulator.
- `Release` - This framework is optimized and will only work on devices. The release framework must be used when submitting an app.

The Debug SDK and Release SDK are *named* the same. This is for convenience. To differentiate the frameworks, you can do one of the following:
- View the contents of the framework. the simulator framework will contain a marker file named **FOR DEBUG**. The release framework will contain a similar marker file, **FOR RELEASE**; or
- In terminal, navigate to the folder containing the framework and type: `lipo -info ConfirmSnapFill.framework/ConfirmSnapFill`. You will either see ARM (release) or x86/i386 (simulator) architecture present.

## Running The Sample

There is a [sample project](https://github.com/confirm-io/confirm-iOS-SnapFill-SDK) included in this repository that acts as a good reference for your own implementation. Included are both Objective-C and Swift samples.

- For Objective-C, choose the `Sample` folder. Open the `ConfirmSnapFillSample.xcodeproj` project file.
- For Swift, choose the `SwiftSample` folder. Open the `SwiftSample.xcodeproj` project file.

Use <kbd>Cmd</kbd>+<kbd>R</kbd> to build and run the demo app.

## Troubleshooting

###### Barcodes are not scanning
<br>

If a barcode doesn’t scan, check the output of your debugger log for an error:<br>
`## [ERROR] ConfirmSnapFill is unauthorized. Barcode will not be processed. Please call 'setApiKey:’ with a valid API key`

You must set your API key prior to attempting a scan.
