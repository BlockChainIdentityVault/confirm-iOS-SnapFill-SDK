#import "ViewController.h"
#import <ConfirmKit/ConfirmKit.h>

@implementation ViewController

- (IBAction)scan {
    // Initialized and return view controller for scanning
    CKScanViewController *vc = [[Confirm sharedInstance] scanLicenseWithCompletion:^(CKIdModel *license) {

        // In this completion block, we want to dismiss the view controller and display an alert
        [self dismissViewControllerAnimated:true completion:^{

            // Extract the first name from the license
            NSString *name = license.bio.firstName;

            // Construct an alert with that name as its message
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"License Found" message:license.bio.firstName preferredStyle:UIAlertControllerStyleAlert];

            // Add a simple action to cancel the alert
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:true completion:nil];
            }]];

            // Present alert
            [self presentViewController:alert animated:true completion:nil];
        }];
    }];

    // Present the scan view controller
    [self presentViewController:vc animated:true completion:nil];
}

@end
