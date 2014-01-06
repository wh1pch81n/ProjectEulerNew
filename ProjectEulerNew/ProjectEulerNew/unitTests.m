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

- (void)listOfPrimesUnder100 {
	DHsieveOfEratosthenes *s = [DHsieveOfEratosthenes new];
	NSLog(@"\nList of Primes Under 100%@", [s generateSieveUpTo:@(100)]);
	NSLog(@"\nLargest prime less than 300 %@", [s getPrimeNumberLessThan:@(300)]);
}

- (void)printEquationWithNuma:(NSInteger)a withNumb:(NSInteger)b {
	DHHalfAdderBase10 *hf = [[DHHalfAdderBase10 alloc] initWithNumA:a withNumB:b];
	if(hf) {
		NSLog(@"%ld + %ld =  %ld:C %ld:S", a, b, [hf cout], [hf solution]);
	}
}

- (void)printEquationWithNuma:(NSInteger)a withNumb:(NSInteger)b withCin:(NSInteger)c{
	DHHalfAdderBase10 *hf = [[DHFullAdderBase10 alloc] initWithNumA:a withNumB:b withCarryIn:c];
	if(hf) {
		NSLog(@"%ld + %ld + %ld = %ld:C %ld:S", a, b, c, [hf cout], [hf solution]);
	}
}

- (void)prob16_0_halfAdder {
	[self printEquationWithNuma:2 withNumb:3];
	[self printEquationWithNuma:9 withNumb:9];
	[self printEquationWithNuma:9 withNumb:3];
	[self printEquationWithNuma:0 withNumb:0];
	[self printEquationWithNuma:-2 withNumb:3];
	[self printEquationWithNuma:-8 withNumb:-3];
	[self printEquationWithNuma:86 withNumb:3];
	[self printEquationWithNuma:7 withNumb:7];
	[self printEquationWithNuma:6 withNumb:6];
	[self printEquationWithNuma:5 withNumb:5];
}

- (void)prob16_1_fullAdder {
	[self printEquationWithNuma:2 withNumb:3 withCin:1];
	[self printEquationWithNuma:9 withNumb:9 withCin:-1];
	[self printEquationWithNuma:9 withNumb:3 withCin:9];
	[self printEquationWithNuma:8 withNumb:3 withCin:99];
	[self printEquationWithNuma:7 withNumb:7 withCin:4];
	[self printEquationWithNuma:6 withNumb:6 withCin:2];
	[self printEquationWithNuma:5 withNumb:5 withCin:8];
}

- (void)prob16_2_bigInteger {
	NSInteger num = 914345645684525237;
	DHBigInteger *big = [[DHBigInteger alloc] initWithNumber:num];
	NSLog(@"create big number(%ld): %s", num, [big stringFromBigInteger].UTF8String);
}

- (void)prob16_3_sumOfDigits {
	DHBigInteger *numa, *numb, *sum;
	numa = [[DHBigInteger alloc] initWithNumber:9];
	sum = [numa plus:numa];
	NSLog(@"9+ 9 = %s", [sum stringFromBigInteger].UTF8String);
	
	numa = [[DHBigInteger alloc] initWithNumber:12];
	numb = [[DHBigInteger alloc] initWithNumber:98];
	sum = [numa plus:numb];
	NSLog(@"12+ 98 = %s", [sum stringFromBigInteger].UTF8String);
	
	numa = [[DHBigInteger alloc] initWithNumber:1257];
	numb = [[DHBigInteger alloc] initWithNumber:982343];
	sum = [numa plus:numb];
	NSLog(@"1257+ 982343 = %s", [sum stringFromBigInteger].UTF8String);
	
	numa = [[DHBigInteger alloc] initWithNumber:1];
	for (int i = 0; i < 1001; ++i) {
		if (i)
			numa = [numa plus:numa];
		printf("2^%d = %s\n", i, [[numa stringFromBigInteger] UTF8String]);
	}
	NSInteger total = 0;
	for (int i = 0; i < [numa numDigits]; ++i) {
		total += [numa digitAtIndex:i];
	}
	NSLog(@"sum of digits of 2^1000 is %ld", total);
}

- (void)print16_4:(NSUInteger)numa :(NSUInteger)numb {
	DHBigInteger *a = [[DHBigInteger alloc] initWithNumber:numa];
	DHBigInteger *b = [[DHBigInteger alloc] initWithNumber:numb];
	DHBigInteger *s = [a times:b];
	NSLog(@"%@ * %@ = %@", [a stringFromBigInteger], [b stringFromBigInteger], [s stringFromBigInteger]);
}

- (void)prob16_4_multDigits {
	[self print16_4:9 :5];
	[self print16_4:9 :9];
	[self print16_4:9 :0];
	[self print16_4:0 :9];
	[self print16_4:3 :10];
	[self print16_4:1127 :3];
	[self print16_4:3 :1127];
	[self print16_4:27245 :6];
	[self print16_4:0 :0];
	[self print16_4:91 :93];
}

- (void)prob17_0_wordFormOfNumbers {
	NSNumber *num = @(4285);
	NSLog(@"ones place:> %@", [num wordFormOfOnesPlace]);
	NSLog(@"tens place:> %@", [num wordFormOfTensPlace]);
	NSLog(@"hundreds place:> %@", [num wordFormOfHundredsPlace]);
	NSLog(@"thousands place:> %@", [num wordFormOfThousandsPlace]);
	NSLog(@"full word form:> %@", [num wordFormOfNumber]);
}

- (void)prob17_1_numFrom1to1000 {
	NSInteger total = 0;
	for (int i = 1; i <= 1000; ++i){
		NSString *wfn = [@(i) wordFormOfNumber];
		NSLog(@"%d:> %@", i, wfn);
		total += [wfn length];
	}
	NSLog(@"total: %ld", total);
}

- (void)prob18_0_smallTriangle {
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

- (void)prob18_1_medTriangle {
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

- (DHBigInteger *)factorial:(NSUInteger)num {
	if (num >1) {
		return [[[DHBigInteger alloc] initWithNumber:num] times:[self factorial:num-1]];
	}
	return [[DHBigInteger alloc] initWithNumber:1];
}

- (void)prob20_0_FactorialDigitSum {
	NSUInteger num = 100;
	NSString *wordNum = [[self factorial:num] stringFromBigInteger] ;
	printf("%ld! = %s\n", num, wordNum.UTF8String);
	NSInteger total = 0;
	for (int i = 0; i < wordNum.length; ++i) {
		printf("%d + ", [wordNum characterAtIndex:i]-'0');
		total += [wordNum characterAtIndex:i] - '0';
	}
	printf("= %ld", total);
}
	
- (void)prob21_0_isAmicableNumber {
	DHAmicableNumber *an = [DHAmicableNumber new];
	if ([an isAmicable:220]) {
		printf("Is Amicable\n");
	} else {
		printf("NOT Amicable\n");
	}
	if ([an isAmicable:284]) {
		printf("Is Amicable\n");
	} else {
		printf("NOT Amicable\n");
	}
}

- (void)prob21_1_sumOfAllAmicableUnder10000 {
	DHAmicableNumber *an = [DHAmicableNumber new];
	NSInteger total = 0;
	for (NSInteger i = 1; i < 10000; ++i) {
		if([an isAmicable:i]){
			printf("%ld\n", i);
			total += i;
		}
	}
	printf("Sum Of all Amicable Numbers Under 10,000: %ld\n", total);
}

- (void)prob22_0_NameScore {
	NSString *fileName = @"/Users/derrickho/Documents/ProjectEulerNew/ProjectEulerNew/ProjectEulerNew/names.txt";
	NSArray *arr = [NameScores arrayOfNamesFromFile:fileName willSort:YES];
	printf("Total Namescore: %ld\n", [NameScores calcTotalScore:arr]);
}

@end
