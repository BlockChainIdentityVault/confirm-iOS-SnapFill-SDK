
#import "CSFIdModel.h"

/**
 This protocol defines a method for handling the successful
 scan of a driver's license, returning the ID Model for the
 license that was scanned.
*/
@protocol CSFScannerDelegate <NSObject>

/**
 This method will be called when a driver's license was
 successfully scanned. The `CSFIdModel`, `license`, that gets
 returned will include the extracted personal information.
*/
- (void)didScanLicense:(CSFIdModel *)license;

@end
