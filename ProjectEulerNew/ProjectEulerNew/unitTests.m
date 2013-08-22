//
//  unitTests.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/16/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "unitTests.h"
#import "HeaderAPI.h"

@implementation unitTests
+ (void)listOfPrimesUnder100 {
	DHsieveOfEratosthenes *s = [DHsieveOfEratosthenes new];
	NSLog(@"\nList of Primes Under 100%@", [s generateSieveUpTo:@(100)]);
	NSLog(@"\nLargest prime less than 300 %@", [s getPrimeNumberLessThan:@(300)]);
}
+ (void)printEquationWithNuma:(NSInteger)a withNumb:(NSInteger)b {
	DHHalfAdderBase10 *hf = [[DHHalfAdderBase10 alloc] initWithNumA:@(a) withNumB:@(b)];
	if(hf) {
		NSLog(@"%ld + %ld = %@:S %@:C", a, b, [hf solution], [hf cout]);
	}
}
+ (void)printEquationWithNuma:(NSInteger)a withNumb:(NSInteger)b withCin:(NSInteger)c{
	DHHalfAdderBase10 *hf = [[DHFullAdderBase10 alloc] initWithNumA:@(a) withNumB:@(b) withCarryIn:@(c)];
	if(hf) {
		NSLog(@"%ld + %ld + %ld = %@:S %@:C", a, b, c, [hf solution], [hf cout]);
	}
}
+ (void)prob16_0_halfAdder {
	[unitTests printEquationWithNuma:2 withNumb:3];
	[unitTests printEquationWithNuma:9 withNumb:9];
	[unitTests printEquationWithNuma:9 withNumb:3];
	[unitTests printEquationWithNuma:0 withNumb:0];
	[unitTests printEquationWithNuma:-2 withNumb:3];
	[unitTests printEquationWithNuma:-8 withNumb:-3];
	(void)[[DHHalfAdderBase10 alloc] initWithNumA:@(9) withNumB:nil];
	[unitTests printEquationWithNuma:86 withNumb:3];
	[unitTests printEquationWithNuma:7 withNumb:7];
	[unitTests printEquationWithNuma:6 withNumb:6];
	[unitTests printEquationWithNuma:5 withNumb:5];
}
+ (void)prob16_1_fullAdder {
	[unitTests printEquationWithNuma:2 withNumb:3 withCin:1];
	[unitTests printEquationWithNuma:9 withNumb:9 withCin:-1];
	[unitTests printEquationWithNuma:9 withNumb:3 withCin:9];
	(void)[[DHFullAdderBase10 alloc] initWithNumA:@(9) withNumB:@(6) withCarryIn:nil];
	[unitTests printEquationWithNuma:8 withNumb:3 withCin:99];
	[unitTests printEquationWithNuma:7 withNumb:7 withCin:4];
	[unitTests printEquationWithNuma:6 withNumb:6 withCin:2];
	[unitTests printEquationWithNuma:5 withNumb:5 withCin:8];
}
//+ (void)prob16_2_bigInteger;
//+ (void)prob16_3_sumOfDigits;
@end
