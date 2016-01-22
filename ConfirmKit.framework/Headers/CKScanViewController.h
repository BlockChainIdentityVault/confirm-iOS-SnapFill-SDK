#import <UIKit/UIKit.h>

@protocol CKScannerDelegate;

@interface CKScanViewController : UIViewController

@property (nonatomic) id<CKScannerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UIView *overlayView;

@end
