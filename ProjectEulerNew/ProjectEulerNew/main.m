//
//  main.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/16/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "unitTests.h"

int main(int argc, const char * argv[])
{
	
	@autoreleasepool {
		NSArray *arrofTests =
		@[
//			[NSValue valueWithPointer:@selector(listOfPrimesUnder100)],
//			[NSValue valueWithPointer:@selector(prob16_0_halfAdder)],
//			[NSValue valueWithPointer:@selector(prob16_1_fullAdder)],
//			[NSValue valueWithPointer:@selector(prob16_2_bigInteger)],
//			[NSValue valueWithPointer:@selector(prob16_3_sumOfDigits)],
//			[NSValue valueWithPointer:@selector(prob16_4_multDigits)],
//			[NSValue valueWithPointer:@selector(prob17_0_wordFormOfNumbers)],
//			[NSValue valueWithPointer:@selector(prob17_1_numFrom1to1000)],
			/**Triangles throwing exception: beyond bounds*/
			//[NSValue valueWithPointer:@selector(prob18_0_smallTriangle)],
			//[NSValue valueWithPointer:@selector(prob18_1_medTriangle)],
//			[NSValue valueWithPointer:@selector(prob20_0_FactorialDigitSum)],
//			[NSValue valueWithPointer:@selector(prob21_0_isAmicableNumber)],
//			[NSValue valueWithPointer:@selector(prob21_1_sumOfAllAmicableUnder10000)],
//			[NSValue valueWithPointer:@selector(prob22_0_NameScore)],
			[NSValue valueWithPointer:@selector(prob24_0_GetPerm)],
			[NSValue valueWithPointer:@selector(prob24_1_getMillionth)],
			];
		
		unitTests *UT = [unitTests new];
		for (int i = 0; i < arrofTests.count; ++i) {
			printf("\n======================\n");
			[UT performSelector:[arrofTests[i] pointerValue]];
		}
		
		
		
	}
	return 0;
}

