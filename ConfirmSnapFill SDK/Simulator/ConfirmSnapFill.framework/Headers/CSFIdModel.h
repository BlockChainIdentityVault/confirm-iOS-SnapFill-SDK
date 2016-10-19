#ifndef CSFIdModel_H
#define CSFIdModel_H

#import <Foundation/Foundation.h>
#import "CSFIssuanceModel.h"
#import "CSFBioModel.h"

@interface CSFIdModel : NSObject

// See relevant headers for available fields
@property (nonatomic, retain) CSFIssuanceModel *issuance;
@property (nonatomic, retain) CSFBioModel *bio;

@end

#endif
