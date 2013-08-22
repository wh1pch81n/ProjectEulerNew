//
//  DHHalfAdder.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/18/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHHalfAdderBase10.h"
@implementation DHHalfAdderBase10
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb {
	if (!(self = [super init])) {
		return nil;
	}
	//init code
	_numa = numa;
	_numb = numb;
	[self checkBoundsOfNum:_numa];
	[self checkBoundsOfNum:_numb];
	if (!_numa || !_numb) {
		return nil;
	}
	NSInteger sum = [numa integerValue] + [numb integerValue];
	_solution = 	@(sum % kBase);
	_cout = @(sum / kBase);
	return self;
}
- (id)init {
	return [self initWithNumA:@(0) withNumB:@(0)];
}
- (NSNumber *)checkBoundsOfNum:(NSNumber *)num {
	@try {
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
	} @catch (NSException *theException) {
		if ([[theException name] isEqualToString:kExceptionNilNum] ||
			[[theException name] isEqualToString:kExceptionNumOutOfBounds]) {
			
			NSLog(@"caught a %@ (%@)", [theException name], num);
		} else {
			NSLog(@"ignored a %@ exception", theException);
			@throw;
		}
		num = nil;
	}
	return num;
}
@end
