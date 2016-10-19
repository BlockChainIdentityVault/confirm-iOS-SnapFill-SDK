#import "AppDelegate.h"
#import <ConfirmSnapFill/ConfirmSnapFill.h>

NSString *const ConfirmSnapFillToken = @"{YOUR_API_KEY}";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[SnapFill sharedInstance] configure:ConfirmSnapFillToken completion:nil];

    return YES;
}

@end
