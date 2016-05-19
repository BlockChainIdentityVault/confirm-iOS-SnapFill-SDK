#import "ViewController.h"
#import "ResultsViewController.h"
#import <ConfirmSnapFill/ConfirmSnapFill.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.startButton.layer.borderColor = UIColor.whiteColor.CGColor;
	self.startButton.layer.borderWidth = 2.f;
	self.startButton.layer.cornerRadius = 5.f;
	
	[NSNotificationCenter.defaultCenter addObserverForName:@"startOverNotification"
													object:nil
													 queue:NSOperationQueue.mainQueue
												usingBlock:^(NSNotification * _Nonnull note) {
													[self reset];
													[self dismissViewControllerAnimated:YES completion:nil];
												}];
}

- (void)reset
{
	[self.navigationController popToRootViewControllerAnimated:NO];
}

#pragma mark - ConfirmSnapFill

- (IBAction)scan
{
    // Initialized and return view controller for scanning
    CSFScanViewController *vc = [SnapFill.sharedInstance scanLicenseWithCompletion:^(CSFIdModel *license) {

		// Prepare the results view controller
		ResultsViewController *rvc = [ResultsViewController controller];
		
		// Set the scanned data (see the CSFIdModel header for usage)
		rvc.idModel = license;
		
        // In this completion block, we want to dismiss the view controller and display a results view controller
        [self dismissViewControllerAnimated:NO completion:^{
			
			// Finally, present the results view controller
			[self presentViewController:rvc animated:YES completion:nil];

        }];
    }];

    // Present the scan view controller
    [self presentViewController:vc animated:true completion:nil];
}

#pragma mark - Appearance

- (UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }
- (BOOL)prefersStatusBarHidden { return NO; }

@end
