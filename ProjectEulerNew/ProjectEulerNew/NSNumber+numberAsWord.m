//
//  NSNumber+numberAsWord.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/26/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "NSNumber+numberAsWord.h"
#define MAX_BOUNDS 9999
#define MIN_BOUNDS 1
#define kExceptionOutOfBounds @"Exeption: Number Out of Bounds"
#define kExceptionOutOfBoundsReason [NSString stringWithFormat:@"The valid bounds are ( %d, %d)", MIN_BOUNDS, MAX_BOUNDS]
@implementation NSNumber (numberAsWord)
- (NSString *)wordFormOfNumber {
	if ([self intValue] >= MIN_BOUNDS && [self intValue] <= MAX_BOUNDS) {
		NSMutableString *fullNum = [NSMutableString new];
		[fullNum appendString:[self wordFormOfThousandsPlace]?:@""];
		[fullNum appendString:[self wordFormOfHundredsPlace]?:@""];
		if( [self intValue] > 100 && [self intValue] %100) [fullNum appendString:@"and"];
		[fullNum appendString:[self wordFormOfTensPlace]?:[self wordFormOfOnesPlace]?:@""];
		return fullNum;
	}
	NSException *e = [[NSException alloc] initWithName:kExceptionOutOfBounds
												reason:kExceptionOutOfBoundsReason
											  userInfo:nil];
	@throw e;
	return nil;
}
- (NSString *)wordFormOfThousandsPlace {
	NSInteger n = [self integerValue];
	n /= 1000;
	if (n) {
		return [[@(n) wordFormOfOnesPlace] stringByAppendingString:@"thousand"];
	}
	return nil;
}
- (NSString *)wordFormOfHundredsPlace {
	NSInteger n = [self integerValue];
	n /= 100;
	if (n) {
		return [[@(n) wordFormOfOnesPlace] stringByAppendingString:@"hundred"];

	}
	return nil;
}
- (NSString *)wordFormOfTensPlace {
	switch ([self integerValue] % 100) {
		case 10: return @"ten";
		case 11: return @"eleven";
		case 12: return @"twelve";
		case 13: return @"thirteen";
		case 14: return @"fourteen";
		case 15: return @"fifteen";
		case 16: return @"sixteen";
		case 17: return @"seventeen";
		case 18: return @"eighteen";
		case 19: return @"nineteen";
		default:
			switch (([self integerValue] % 100) /10) {
				case 2: return [@"twenty" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
				case 3: return [@"thirty" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
				case 4: return [@"forty" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
				case 5: return [@"fifty" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
				case 6: return [@"sixty" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
				case 7: return [@"seventy" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
				case 8: return [@"eighty" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
				case 9: return [@"ninety" stringByAppendingString:[self wordFormOfOnesPlace]?:@""];
			}
	}
	return nil;
}
- (NSString *)wordFormOfOnesPlace {
	switch ([self integerValue] %10) {
//		case 0: return @"zero";
		case 1: return @"one";
		case 2: return @"two";
		case 3: return @"three";
		case 4: return @"four";
		case 5: return @"five";
		case 6: return @"six";
		case 7: return @"seven";
		case 8: return @"eight";
		case 9: return @"nine";
	}
	return nil;
}
@end
