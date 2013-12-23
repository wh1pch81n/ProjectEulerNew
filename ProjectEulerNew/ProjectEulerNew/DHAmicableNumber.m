//
//  DHAmicableNumber.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 12/23/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHAmicableNumber.h"

@implementation DHAmicableNumber
- (BOOL) isAmicable:(NSInteger)num {
	return (num == [self sumDivisorsOf:[self sumDivisorsOf:num]]);
}
	
-(NSInteger)sumDivisorsOf:(NSInteger)num {
	NSInteger num2 = 0;
	for (NSInteger i = 1; i < num; ++i) {
		if((num % i) == 0) {
			num2 += i;
		}
	}
	return num2;
}
@end
