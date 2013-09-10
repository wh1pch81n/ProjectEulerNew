//
//  DHHalfAdder.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/18/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHHalfAdderBase10.h"
const NSInteger kBase = 10;

@implementation DHHalfAdderBase10
@synthesize numa = _numa;
@synthesize numb = _numb;
- (id)initWithNumA:(NSInteger)numa withNumB:(NSInteger)numb {
	if (self = [super init]) {
		[self setNuma:numa%kBase];
		[self setNumb:numb%kBase];
	}
	return self;
}

#pragma mark - outputs
- (NSInteger)solution {
	return ([self numa] + [self numb])% kBase;
}
- (NSInteger)cout {
	return ([self numa] + [self numb]) / kBase;
}
@end
