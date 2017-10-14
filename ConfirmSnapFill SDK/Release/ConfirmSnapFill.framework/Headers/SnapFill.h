#import <UIKit/UIKit.h>
#import "CSFScanViewController.h"
#import "CSFIdModel.h"

/**
 This class provides top-level access to the SnapFill.io SDK. It is
 to be used as a singleton (see `sharedInstance`) in order to take
 advantage of the SDK's underlying functionality.
*/
@interface SnapFill : NSObject

/**
 The single shared instance of the `SnapFill` singleton. You should
 always use this, rather than initializing and storing your own
 `SnapFill` instance.
 */
+ (SnapFill*)sharedInstance;

/**
 Call this method with your SnapFill.io provided API token before
 attempting to consume the SDK, as certain functionality is
 prohibited unless the SDK is successfully authorized. If you do
 not have an API key, please visit confirm.io to obtain one.
 */

- (void)setAPIKey:(NSString *)key;

/**
 This method returns a view controller for scanning a driver's
 license, configured with the default overlay and the `SnapFill`
 singleton as its delegate.

 `completion` will be called upon successfully scanning an ID.
 This completion block is optional, and you may instead choose
 to implement `CSFScannerDelegate` yourself. If you choose to
 do so, please ensure that you are properly setting the delegate
 of the view controller returned from this method.

 See documentation for further information.
*/
- (CSFScanViewController *)scanLicenseWithCompletion:(void (^) (CSFIdModel *))completion;

@end
