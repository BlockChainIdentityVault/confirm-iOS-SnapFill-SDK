#ifndef CSFIssuanceModel_H
#define CSFIssuanceModel_H

#import <Foundation/Foundation.h>

@interface CSFIssuanceModel : NSObject

// Information is provided exactly as described on the barcode
@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSDate *issued;
@property (nonatomic, retain) NSDate *expiration;

@end

#endif
