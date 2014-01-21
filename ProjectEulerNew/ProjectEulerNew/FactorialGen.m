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
		//self->runningPerm = [NSMutableString new];
		[self generateTree:str :nil];
	}
	return self;
}

- (void)generateTree:(NSString *)str :(NSString *)run{
	if (!str) {
		[self generateTree:@"" :nil];
	} else if ([str isEqualToString:@""]) {
			[self->arrTree addObject:run];
		return;
	}

	for (int i = 0; i < str.length; ++i) {
		NSString *s = [str stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@""];
	
		NSString *grow = [NSString stringWithFormat:@"%@%@", run?:@"", [str substringWithRange:NSMakeRange(i, 1)]];
		[self generateTree:s :grow];
	}
}

- (NSArray *)arrayOfPermutations {
	return self->arrTree;
}

@end
