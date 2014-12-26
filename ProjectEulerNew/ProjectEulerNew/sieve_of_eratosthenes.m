//
//  sieve_of_eratosthenes.m
//  sieve_of_eratosthenes
//
//  Created by Derrick Ho on 8/2/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "sieve_of_eratosthenes.h"

@implementation DHsieveOfEratosthenes

- (NSArray *)generateSieveUnrefined:(NSNumber *)maxNum {
	NSMutableArray *sieveUnrefined = NSMutableArray.new;
	for (NSInteger i = 0; i <= maxNum.integerValue; ++i)
        [sieveUnrefined addObject:@(i > 1 ? YES : NO)];
	
	for (NSInteger  i = 2; i <= maxNum.integerValue; ++i) {
		if ([sieveUnrefined[i] boolValue] == YES) {
			NSInteger j = i * i;
			for (NSInteger jMul = 0; (j + jMul) <= maxNum.integerValue; jMul += i)
				sieveUnrefined[j + jMul] = @NO;
		}
	}
	return sieveUnrefined;
}

+ (NSArray *)generateSieveUpTo:(NSNumber *)maxNum {
    DHsieveOfEratosthenes *sieve = DHsieveOfEratosthenes.new;
    NSArray *sieveUnrefined = [sieve generateSieveUnrefined:maxNum];
	NSMutableArray *cleanSieve = NSMutableArray.new;
	for (NSInteger i = 0; i < sieveUnrefined.count; ++i) {
		if ([sieveUnrefined[i] boolValue] == YES)
			[cleanSieve addObject:@(i)];
	}
	return cleanSieve;
}

+ (NSNumber *)getPrimeNumberLessThan:(NSNumber *)num {
	return [[DHsieveOfEratosthenes generateSieveUpTo:num] lastObject];
}
@end
