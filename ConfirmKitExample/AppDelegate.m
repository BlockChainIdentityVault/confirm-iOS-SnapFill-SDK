#import "AppDelegate.h"
#import <ConfirmKit/ConfirmKit.h>

NSString *const ConfirmToken = @"11bfbcce-f244-40f3-ac52-9b4bdfea3ebe";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Confirm sharedInstance] configure:ConfirmToken completion:nil];

    return YES;
}

@end
