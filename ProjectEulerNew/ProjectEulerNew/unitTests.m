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
+ (void)prob16_2_bigInteger {
	DHBigInteger *big = [[DHBigInteger alloc] initWithNumber:@(914325237)];
	NSLog(@"create big number: %s", [big stringFromBigInteger].UTF8String);
}
+ (void)prob16_3_sumOfDigits {
	DHBigInteger *numa, *numb, *sum;
	numa = [[DHBigInteger alloc] initWithNumber:@(9)];
	sum = [[DHBigInteger alloc] initByAddingBigInteger1:numa withBigInteger:numa];
	NSLog(@"9+ 9 = %s", [sum stringFromBigInteger].UTF8String);
	
	numa = [[DHBigInteger alloc] initWithNumber:@(12)];
	numb = [[DHBigInteger alloc] initWithNumber:@(98)];
	sum = [[DHBigInteger alloc] initByAddingBigInteger1:numa withBigInteger:numb];
	NSLog(@"12+ 98 = %s", [sum stringFromBigInteger].UTF8String);
	
	numa = [[DHBigInteger alloc] initWithNumber:@(1257)];
	numb = [[DHBigInteger alloc] initWithNumber:@(982343)];
	sum = [[DHBigInteger alloc] initByAddingBigInteger1:numa withBigInteger:numb];
	NSLog(@"1257+ 982343 = %s", [sum stringFromBigInteger].UTF8String);
	
	numa = [[DHBigInteger alloc] initWithNumber:@(1)];
	for (int i = 0; i < 1001; ++i) {
		if (i)
			numa = [[DHBigInteger alloc] initByAddingBigInteger1:numa withBigInteger:numa];
		NSLog(@"2^%d = %@", i, [numa stringFromBigInteger]);
	}
	NSInteger total = 0;
	NSString *numStr = [numa stringFromBigInteger];
	for (int i = 0; i < [numStr length]; ++i) {
		total += [[numStr substringWithRange:NSMakeRange(i, 1)] integerValue];
	}
	NSLog(@"sum of digits of 2^1000 is %ld", total);
}

+ (void)prob18_0_smallTriangle {
	NSString *filePath = @"/Users/derrickho/Desktop/ProjectEulerNew/ProjectEulerNew/ProjectEulerNew/smallTriangle";
	NSString *f = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:nil];
	NSArray *arrRows = [f componentsSeparatedByString:@"\n"];
	NSMutableArray *tri = [NSMutableArray new];
	for ( NSString *rowNum in arrRows) {
		[tri addObject:[[rowNum componentsSeparatedByString:@" "] mutableCopy]];
	 }
	TrianglePaths *T = [TrianglePaths new];
	printf ("%ld\n", [T maxPathSumWIthTriangle:tri]);
}
+ (void)prob18_1_medTriangle {
	NSString *filePath = @"/Users/derrickho/Desktop/ProjectEulerNew/ProjectEulerNew/ProjectEulerNew/medTriangle";
	NSString *f = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:nil];
	NSArray *arrRows = [f componentsSeparatedByString:@"\n"];
	NSMutableArray *tri = [NSMutableArray new];
	for ( NSString *rowNum in arrRows) {
		[tri addObject:[[rowNum componentsSeparatedByString:@" "] mutableCopy]];
	}
	TrianglePaths *T = [TrianglePaths new];
	printf ("%ld\n", [T maxPathSumWIthTriangle:tri]);
}
@end
