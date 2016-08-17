//
//  ResultsViewController.m
//  ConfirmSnapFill Sample
//
//  Created by Greg Peet on 5/10/16.
//
//

#import "ResultsViewController.h"

#import <ConfirmSnapFill/ConfirmSnapFill.h>

#import "OneTableCell.h"
#import "TwoTableCell.h"

#define ENABLE_BACK_BUTTON	0

#define kOneTableCell		@"OneTableCell"
#define kTwoTableCell		@"TwoTableCell"

#define D_YEAR				31556926

@interface ResultsViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *backArrowImageView;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSArray *counts;

@end

@implementation ResultsViewController

+ (ResultsViewController *)controller
{
	ResultsViewController* rvc = [[ResultsViewController alloc] initWithNibName:NSStringFromClass(self) bundle:nil];
	return rvc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	
	UINib* oneNib = [UINib nibWithNibName:kOneTableCell bundle:nil];
	UINib* twoNib = [UINib nibWithNibName:kTwoTableCell bundle:nil];
	[self.tableView registerNib:oneNib forCellReuseIdentifier:kOneTableCell];
	[self.tableView registerNib:twoNib forCellReuseIdentifier:kTwoTableCell];
	
#if ENABLE_BACK_BUTTON
#else
	self.backButton.hidden =
	self.backArrowImageView.hidden = YES;
#endif
}

- (void)setIdModel:(CSFIdModel *)idModel
{
	_idModel = idModel;
	CSFIssuanceModel *issuanceModel  = idModel.issuance;
	CSFBioModel		*bioModel		= idModel.bio;
	
	BOOL showCountry = idModel.bio.country && idModel.bio.country.length;
	
	NSInteger age = 0;
	if (bioModel.birthday) {
		NSTimeInterval ti = [NSDate.date timeIntervalSinceDate:bioModel.birthday];
		age = (NSInteger)(ti / D_YEAR);
	}
	
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	dateFormatter.dateFormat = @"MM-dd-yyyy";
	
	self.counts = @[
					@[@2,
					  @2,
					  @2,
					  @1,
					  @2,
					  showCountry?@2:@1],
  					@[@2,
					  @1],
					];
	self.titles = @[
					@[@"First Name", @"Middle Name",
					  @"Last Name", @"Gender",
					  @"Age", @"DOB",
					  @"Address",
					  @"City", @"State",
					  @"Zip Code", @"Country"],
					@[@"Number", @"Issue Date",
					  @"Expiration Date"],
					];
	
	self.values = @[
					@[bioModel.firstName?bioModel.firstName:@"", bioModel.middleName?bioModel.middleName:@"",
					  bioModel.lastName?bioModel.lastName:@"", bioModel.gender?bioModel.gender:@"",
					  age?@(age).stringValue:@"", bioModel.birthday?[dateFormatter stringFromDate:bioModel.birthday]:@"",
					  bioModel.address?bioModel.address:@"",
					  bioModel.city?bioModel.city:@"", bioModel.state?bioModel.state:@"",
					  bioModel.zip?bioModel.zip:@"", bioModel.country?bioModel.country:@""],
					@[issuanceModel.number?issuanceModel.number:@"", issuanceModel.issued?[dateFormatter stringFromDate:issuanceModel.issued]:@"",
					  issuanceModel.expiration?[dateFormatter stringFromDate:issuanceModel.expiration]:@""
					  ],
					];
}

#pragma mark - Table View

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSUInteger			section = indexPath.section;
	NSArray*			rowcounts = self.counts[section];
	NSNumber*			nscellcount = rowcounts[indexPath.row];
	NSUInteger			cellcount = nscellcount.integerValue;
	
	NSString*			identifier = cellcount == 1 ? kOneTableCell : kTwoTableCell;
	UITableViewCell*	cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
	
	NSUInteger			index = [self indexForIndexPath:indexPath];
	
	if (cellcount == 1) {
		OneTableCell* cell1 = (OneTableCell*)cell;
		
		cell1.titleLabel.text = self.titles[section][index];
		cell1.valueLabel.text = self.values[section][index];
	}
	else if (cellcount == 2) {
		TwoTableCell* cell2 = (TwoTableCell*)cell;
		
		cell2.title1Label.text = self.titles[section][index];
		cell2.value1Label.text = self.values[section][index];
		cell2.title2Label.text = self.titles[section][index+1];
		cell2.value2Label.text = self.values[section][index+1];
	}
	
	return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	CGRect		r = CGRectMake(0, 0, tableView.bounds.size.width, 26);
	UILabel* 	label = [[UILabel alloc] initWithFrame:r];
	
	label.font = [UIFont fontWithName:@"Helvetica-Neue" size:14.f];
	label.textColor = UIColor.whiteColor;
	label.textAlignment = NSTextAlignmentCenter;
	label.backgroundColor = [UIColor colorWithWhite:0.22 alpha:1.0];
	label.numberOfLines	= 1;
	
	switch (section) {
		case 0:
			label.text = @"PERSONAL INFORMATION";
			break;
		case 1:
			label.text = @"ISSUANCE";
			break;
		default:
			label.text = nil;
			break;
	}
	
	return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 24.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.counts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.counts[section] count];
}

- (NSUInteger)indexForIndexPath:(NSIndexPath*)indexPath
{
	NSArray*			rowcounts = self.counts[indexPath.section];
	NSUInteger			index = 0;
	
	for (int i = 0; i < indexPath.row; ++i)
		index += [rowcounts[i] integerValue];
	
	return index;
}

#pragma mark - Results Actions

- (IBAction)startOverTapped:(id)sender
{
	[NSNotificationCenter.defaultCenter postNotificationName:@"startOverNotification" object:nil];
}

- (IBAction)backButtonTapped:(id)sender
{
	[NSNotificationCenter.defaultCenter postNotificationName:@"startOverNotification" object:nil];
}

#pragma mark - Appearance

- (UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }
- (BOOL)prefersStatusBarHidden { return NO; }

@end
