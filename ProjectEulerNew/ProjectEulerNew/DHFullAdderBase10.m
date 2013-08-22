//
//  DHFullAdderBase10.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/21/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHFullAdderBase10.h"

@implementation DHFullAdderBase10
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb withCarryIn:(NSNumber *)cin{
	if (!(self = [super init])) {
		return nil;
	}
	//init code
	_numa = [self checkBoundsOfNum:numa];
	_numb = [self checkBoundsOfNum:numb];
	_cin = [self checkBoundsOfNum:cin];
	if (!_numa || !_numb || !_cin) {
		return nil;
	}
	NSInteger sum = [numa integerValue] + [numb integerValue] + [cin integerValue];
	_solution = @(sum % kBase);
	_cout = @(sum / kBase);
	return self;
}
- (id)init {
	return [self initWithNumA:@(0) withNumB:@(0) withCarryIn:@(0)];
}
@end
