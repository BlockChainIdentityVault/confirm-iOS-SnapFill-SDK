#import <Foundation/Foundation.h>

@interface CKIssuanceModel : NSObject

@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSDate *issued;
@property (nonatomic, retain) NSDate *expiration;

@end
