#import "AppDelegate.h"
#import <ConfirmSnapFill/ConfirmSnapFill.h>

NSString *const ConfirmSnapFillAPIKey = @"{YOUR_API_KEY}";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[SnapFill.sharedInstance setAPIKey:ConfirmSnapFillAPIKey];

    return YES;
}

@end
