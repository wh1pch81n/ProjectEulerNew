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
	if (!(self = [super init]) || !(_numa = [self checkBoundsOfNum:numa]) || !(_numb = [self checkBoundsOfNum:numb])) {
		return nil;
	}
	//init code
	return self;
}
- (id)initWithNumA:(NSNumber *)numa {
	return [self initWithNumA:numa withNumB:@(0)];
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
#pragma mark sum of inputs
- (NSInteger)sumOfInputs {
	return [_numa integerValue] + [_numb integerValue];
}
#pragma mark - outputs
- (NSNumber *)solution {
	return @([self sumOfInputs] % kBase);
}
- (NSNumber *)cout {
	return @([self sumOfInputs] / kBase);
}
@end
