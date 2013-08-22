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
	if (!(self = [super initWithNumA:numa withNumB:numb]) || !(_cin = [self checkBoundsOfNum:cin])) {
		return nil;
	}
	//init code
	return self;
}
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb {
	return [self initWithNumA:numa withNumB:numb withCarryIn:@(0)];
}
- (id)initWithNumA:(NSNumber *)numa {
	return [self initWithNumA:numa withNumB:@(0) withCarryIn:@(0)];
}
- (id)init {
	return [self initWithNumA:@(0) withNumB:@(0) withCarryIn:@(0)];
}
#pragma mark sum of inputs
- (NSInteger)sumOfInputs {
	return [super sumOfInputs] + [_cin integerValue];
}
@end
