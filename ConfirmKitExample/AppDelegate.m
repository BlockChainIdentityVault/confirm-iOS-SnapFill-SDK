#import "AppDelegate.h"
#import <ConfirmKit/ConfirmKit.h>

NSString *const ConfirmToken = @"{YOUR_API_KEY}";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Confirm sharedInstance] configure:ConfirmToken completion:nil];

    return YES;
}

@end
