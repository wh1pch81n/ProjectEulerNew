//
//  DHFullAdderBase10.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/21/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHFullAdderBase10.h"

@implementation DHFullAdderBase10
@synthesize cin = _cin;

- (id)initWithNumA:(NSInteger)numa withNumB:(NSInteger)numb withCarryIn:(NSInteger)cin{
	if (self = [super initWithNumA:numa withNumB:numb]) {
		[self setCin:cin%kBase];
	}
	return self;
}

- (NSInteger)solution {
	return ([self numa] + [self numb] + [self cin]) %kBase;
}

- (NSInteger)cout {
	return ([self numa] + [self numb] + [self cin]) /kBase;
}

@end
