//
//  DHBigInteger.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/22/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHBigInteger.h"
#import "DHFullAdderBase10.h"

@interface DHBigInteger ()
@property (strong, nonatomic)NSMutableArray *bigNumber;
@end;

@implementation DHBigInteger
@synthesize bigNumber = _bigNumber;

- (id)initWithNumber:(NSInteger)num {
	if( self = [super init]) {
		//the zeroth digit of the number corresponds to the index zero of the array.
		NSMutableArray *arrOfFA = [NSMutableArray new];
		DHFullAdderBase10 *FA = nil;
		do {
			NSInteger LSD = num %kBase;
			FA = [DHFullAdderBase10 new];
			[FA setNuma:LSD];
			[arrOfFA addObject:FA];
			num /= kBase;
		} while (num);
		[self setBigNumber:arrOfFA];
		return self;
	}
	return nil;
}

- (id)init {
	return [self initWithNumber:0];
}

- (NSString *)stringFromBigInteger {
	NSMutableString *mStr = [NSMutableString new];
	for (int i = (int)[[self bigNumber] count] -1; i >= 0; --i) {
		[mStr appendFormat:@"%ld", [[[self bigNumber] objectAtIndex:i] solution]];
	}
	return mStr;
}

- (DHBigInteger *)plus:(DHBigInteger *)b {
	if (!b) { return self;}
	NSInteger aSize = [[self bigNumber] count];
	NSInteger bSize = [[b bigNumber] count];
	NSInteger max = (aSize > bSize)? aSize: bSize;
	DHFullAdderBase10 *FA = nil;
	NSMutableArray *newBigNum = [NSMutableArray new];
	for (NSInteger i = 0; i < max; ++i) {
		NSInteger numa = (self.bigNumber.count > i)?[[[self bigNumber] objectAtIndex:i] solution]: 0;
		NSInteger numb = (b.bigNumber.count > i)?[[[b bigNumber] objectAtIndex:i] solution]: 0;
		NSInteger cin = [FA cout]; //the first iteration will ahve FA equal nil which should set cin as zero
		FA = [[DHFullAdderBase10 alloc] initWithNumA:numa withNumB:numb  withCarryIn:cin];
		[newBigNum addObject:FA];
	}
	if ([FA cout] > 0) {
		[newBigNum addObject:[[DHFullAdderBase10 alloc] initWithNumA:[FA cout] withNumB:0]];
	}
	
	return [self bigIntegerWithArray:newBigNum];
}

//one digit multiplies by one digit
- (DHBigInteger *)singleMult:(DHBigInteger *)b {
	DHBigInteger *total = [[DHBigInteger alloc] initWithNumber:0];
	for (; ![b isEqualToZero]; b = [b plus:[[DHBigInteger alloc] initWithNumber:-1]]) {
		total = [total plus:self];
	}
	return total;
}

- (BOOL)isEqualToZero {
	return [[self stringFromBigInteger] integerValue] == 0;
}
#warning this method is buggy when multiplying number larger than 9
- (DHBigInteger *)times:(DHBigInteger *)b {
	DHBigInteger *sum = [[DHBigInteger alloc] initWithNumber:0];
	DHBigInteger *shiftedX = [self bigIntegerFromBigInteger:self];
	NSInteger bitWidth = (self.bigNumber.count > b.bigNumber.count)? self.bigNumber.count: b.bigNumber.count;
	for (NSInteger j = 0; j < bitWidth; ++j) {
		if ((j < [[b bigNumber] count])&& [[[b bigNumber] objectAtIndex:j] solution]) {
			sum = [b singleMult:shiftedX];
		}
		shiftedX = [shiftedX plus:
					[shiftedX plus:
					 [shiftedX plus:
					  [shiftedX plus:
					   [shiftedX plus:
						[shiftedX plus:
						 [shiftedX plus:
						  [shiftedX plus:
						   shiftedX]]]]]]]];
	}
	return sum;
}

- (DHBigInteger *)bigIntegerWithArray:(NSMutableArray *)b {
	id newInstance = [[[self class] alloc] init];
	[newInstance setBigNumber:b];
	return newInstance;
}

- (NSUInteger)numDigits {
	return [[self bigNumber] count];
}

- (NSUInteger)digitAtIndex:(NSUInteger)index {
	return [[self bigNumber][index] solution];
}

- (id)bigIntegerFromBigInteger:(DHBigInteger *)b {
	id newInstance = [[[self class] alloc] init];
	[newInstance setBigNumber:[[b bigNumber] mutableCopy]];
	return newInstance;
}
@end
