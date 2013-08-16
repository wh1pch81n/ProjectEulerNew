//
//  unitTests.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/16/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "unitTests.h"

@implementation unitTests
+ (void)listOfPrimesUnder100 {
	DHsieveOfEratosthenes *s = [DHsieveOfEratosthenes new];
	NSLog(@"\nList of Primes Under 100%@", [s generateSieveUpTo:@(100)]);
	NSLog(@"\nLargest prime less than 300 %@", [s getPrimeNumberLessThan:@(300)]);
}
@end
