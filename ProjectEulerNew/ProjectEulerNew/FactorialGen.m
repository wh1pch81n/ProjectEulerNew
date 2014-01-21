//
//  FactorialGen.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 1/20/14.
//  Copyright (c) 2014 Derrick Ho. All rights reserved.
//

#import "FactorialGen.h"

@implementation FactorialGen

- (id)init {
	return [self initWithString:Nil];
}

- (id)initWithString:(NSString *)str {
	if(self = [super init]) {
		self->arrTree = [NSMutableArray new];
		self->runningPerm = [NSMutableString new];
		[self generateTree:str];
	}
	return self;
}

- (void)generateTree:(NSString *)str {
	if (!str) {
		[self generateTree:@""];
	} else if ([str isEqualToString:@""]) {
		if (self->runningPerm.length)
			[self->arrTree addObject:self->runningPerm];
		self->runningPerm = [NSMutableString new];
		return;
	}
	
	for (int i = 0; i < str.length; ++i) {
		NSString *s = [str stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@""];
		[self->runningPerm appendString:[str substringWithRange:NSMakeRange(i, 1)]];
		[self generateTree:s];
	}
}

@end
