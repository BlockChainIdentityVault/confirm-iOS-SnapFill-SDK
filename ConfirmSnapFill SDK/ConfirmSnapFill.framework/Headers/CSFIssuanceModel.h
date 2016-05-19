#import <Foundation/Foundation.h>

@interface CSFIssuanceModel : NSObject

@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSDate *issued;
@property (nonatomic, retain) NSDate *expiration;

@end
