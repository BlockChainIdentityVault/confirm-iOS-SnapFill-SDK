#import <Foundation/Foundation.h>

@interface CSFBioModel : NSObject

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *middleName;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *zip;
@property (nonatomic, retain) NSString *eyeColor;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSDate *birthday;
@property (nonatomic, assign) bool organDonor;

@end
