#import "AppDelegate.h"
#import <ConfirmKit/ConfirmKit.h>

NSString *const ConfirmToken = @"d8e756c3-7542-4254-b453-9c8a34f0e77c";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Confirm sharedInstance] configure:ConfirmToken completion:nil];

    return YES;
}

@end
