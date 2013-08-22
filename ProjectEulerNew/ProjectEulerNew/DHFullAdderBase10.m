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
	[self internalSetNumA:[self checkBoundsOfNum:numa]];
	[self internalSetNumB:[self checkBoundsOfNum:numb]];
	[self internalSetCin:[self checkBoundsOfNum:cin]];
	if (!_cin || ![self internalNumA] || ![self internalNumB]) {
		return nil;
	}
	NSInteger sum = [numa integerValue] + [numb integerValue] + [cin integerValue];
	[self privateSetSolution:@(sum % kBase)];
	[self privateSetCout:@(sum / kBase)];
	return self;
}
- (id)init {
	return [self initWithNumA:@(0) withNumB:@(0) withCarryIn:@(0)];
}
@end
