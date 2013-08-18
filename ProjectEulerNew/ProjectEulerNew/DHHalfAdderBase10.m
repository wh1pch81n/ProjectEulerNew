//
//  DHHalfAdder.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/18/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHHalfAdderBase10.h"
#define kBase 10
#define kExceptionNilNum @"NilNumberException"
#define kExceptionNilNumReason @"Number can not be nil"
#define kExceptionNumOutOfBounds @"NumberOutOfBoundsException"
#define kExceptionNumOutOfBoundsReason @" 0 <= Num <= 9"
@interface DHHalfAdderBase10 ()
@property (strong, nonatomic) NSNumber *numa;
@property (strong, nonatomic) NSNumber *numb;
@property (strong, nonatomic) NSNumber *solution;
@property (strong, nonatomic) NSNumber *cout;
@end
@implementation DHHalfAdderBase10
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb {
	if (!(self = [super init])) {
		return nil;
	}
	//init code
	@try {
		[self setNuma:[self checkBoundsOfNum:numa]];
		[self setNumb:[self checkBoundsOfNum:numb]];
	} @catch (NSException *theException) {
		if ([[theException name] isEqualToString:kExceptionNilNum] ||
			[[theException name] isEqualToString:kExceptionNumOutOfBounds]) {
			NSLog(@"caught a %@", [theException name]);
		} else {
			NSLog(@"ignored a %@ exception", theException);
			@throw;
		}
	}
	NSInteger sum = [numa integerValue] + [numb integerValue];
	[self setSolution:@(sum % kBase)];
	[self setCout:@(sum / kBase)];
	return self;
}
- (id)init {
	return [self initWithNumA:@(0) withNumB:@(0)];
}
- (NSNumber *)checkBoundsOfNum:(NSNumber *)num {
	if (!num) {
		NSException *e = [NSException exceptionWithName:kExceptionNilNum
												 reason:kExceptionNilNumReason
											   userInfo:nil];
		@throw e;
	}else if ([num integerValue] <0 || [num integerValue] > 9) {
		NSException *e = [NSException exceptionWithName:kExceptionNumOutOfBounds
												 reason:kExceptionNumOutOfBoundsReason
											   userInfo:nil];
		@throw e;
	}
	return num;
}
@end
