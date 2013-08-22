//
//  DHBigInteger.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/22/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHBigInteger.h"
#import "DHFullAdderBase10.h"

@implementation DHBigInteger
- (id)initWithNumber:(NSNumber *)num {
	if( self = [super init]) {
		//the zeroth digit of the number corresponds to the index zero of the array.
		NSMutableArray *arrOfFA = [NSMutableArray new];
		NSInteger n = [num integerValue];
		for(;n; n /= 10) {
			int LSD = n % 10;
			DHFullAdderBase10 *FA = [[DHFullAdderBase10 alloc] initWithNumA: @(LSD)];
			[arrOfFA addObject:FA];
		}
		_number = arrOfFA;
		return self;
	}
	return nil;
}
- (id)init {
	return [self initWithNumber:@(0)];
}
- (NSString *)stringFromBigInteger {
	NSMutableString *mStr = [NSMutableString new];
	for (int i = (int)_number.count -1; i >= 0; --i) {
		[mStr appendString:[[[_number objectAtIndex:i] solution] stringValue]];
	}
	return mStr;
}
- (id)initByAddingBigInteger1:(DHBigInteger *)num1 withBigInteger:(DHBigInteger *)num2 {
	if (self = [super init]) {
		NSInteger max1 = [num1->_number count];
		NSInteger max2 = [num2->_number count];
		NSMutableArray *arrOfFA = [NSMutableArray new];
		for (NSInteger i = 0; i < max1 || i <max2; ++i) {
			NSInteger numa = !(i < max1)? 0: [[num1->_number[i] solution] integerValue];
			NSInteger numb = !(i < max2)? 0: [[num2->_number[i] solution] integerValue];
			NSInteger cin = ( i == 0)? 0: [[arrOfFA[i-1] cout] integerValue];
			DHFullAdderBase10 *FA = [[DHFullAdderBase10 alloc] initWithNumA:@(numa)
																   withNumB:@(numb)
																withCarryIn:@(cin)];
			[arrOfFA addObject:FA];
		}
		int carry = [[[arrOfFA lastObject] cout] intValue];
		if ( carry > 0) {
			[arrOfFA addObject:[[DHFullAdderBase10 alloc] initWithNumA:@(carry)]];
		}
		_number = arrOfFA;
		return self;
	}
	return nil;
}
@end
