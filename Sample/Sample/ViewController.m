#import "ViewController.h"
#import <ConfirmSnapFill/ConfirmSnapFill.h>

@interface ViewController ()
@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Listen for a start over (back arrow) notification
	[NSNotificationCenter.defaultCenter addObserverForName:@"startOverNotification"
													object:nil
													 queue:NSOperationQueue.mainQueue
												usingBlock:^(NSNotification * _Nonnull note) {
													[self dismissViewControllerAnimated:YES completion:nil];
												}];
}

#pragma mark - ConfirmSnapFill

/*
	
	A simple example of presenting the CFScanViewController and displaying an alert
	containing various (data derived from the ID Model after a successful scan)
	
	Note: numbers in comments indicate sequential order of steps
	
	*/
- (IBAction)scan
{
    // #1 - Get the view controller for scanning and begin scanning with a callback
    CSFScanViewController *vc = [SnapFill.sharedInstance scanLicenseWithCompletion:^(CSFIdModel *license) {

		// #3 - Begin scanning and handle the resulting model with a callback
		[self dismissViewControllerAnimated:YES completion:^{
			
			// #4 - Begin aggregating the data you desire from the model's constituent parts
			// (see headers for CSFBioModel and CSFIssuanceModel)
			NSDateFormatter *dateFormatter = [NSDateFormatter new];
			dateFormatter.dateFormat = @"MM-dd-yyyy";
			
			NSString *resultString = [NSString stringWithFormat:@"Name: %@ %@\nDOB: %@\nNumber: %@",
									  license.bio.firstName,
									  license.bio.lastName,
									  [dateFormatter stringFromDate:license.bio.birthday],
									  license.issuance.number];
			
			UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Confirm SnapFill"
																					 message:resultString
																			  preferredStyle:UIAlertControllerStyleAlert];
			[alertController addAction:[UIAlertAction actionWithTitle:@"Done"
																style:UIAlertActionStyleDefault
															  handler:^(UIAlertAction * _Nonnull action) {
																// #6 - Dismiss the alert to complete scan cycle
																[self dismissViewControllerAnimated:YES completion:nil];
															  }]];
			
			// #5 - Show the alert
			[self presentViewController:alertController animated:YES completion:nil];
		}];
    }];

    // #2 - Present the view controller
    [self presentViewController:vc animated:true completion:nil];
}


@end
