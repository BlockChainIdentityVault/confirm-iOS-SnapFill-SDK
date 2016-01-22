#import <UIKit/UIKit.h>
#import "CKScanViewController.h"
#import "CKIdModel.h"

/**
 This class provides top-level access to the Confirm.io SDK. It is
 to be used as a singleton (see `sharedInstance` in order to take
 advantage of the SDK's underlying functionality.
*/
@interface Confirm : NSObject

/**
 The single shared instance of the `Confirm` singleton. You should
 always use this, rather than initializing and storing your own
 `Confirm` instance, to prevent inconsistencies in SDK usage.
 */
+ (instancetype)sharedInstance;

/**
 Call this method with your Confirm.io provided API token before
 attempting to consume the SDK, as certain functionality is
 prohibited unless the SDK is successfully authorized. If you do
 not have an API key, please visit Confirm.io to obtain one.
*/
- (void)configure:(NSString *)apiKey completion:(void (^)(BOOL authorized, NSError *error))completion;

/**
 This method returns a view controller for scanning a driver's
 license, configured with the default overlay and the `Confirm`
 singleton as its delegate, such that `completion` will be called
 upon successfully scanning an ID. This completion block is
 optional, and you may instead choose to implement
 `CKScannerDelegate` yourself. If you do so, please ensure that
 you are properly setting the delegate of the view controller
 returned from this method.
*/
- (CKScanViewController *)scanLicenseWithCompletion:(void (^) (CKIdModel *))completion;

@end
