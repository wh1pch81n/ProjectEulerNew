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
		//	    [unitTests listOfPrimesUnder100];
		//		[unitTests prob16_0_halfAdder];
		//		printf("======================\n");
		//		[unitTests prob16_1_fullAdder];
		//		printf("======================\n");
		//		[unitTests prob16_2_bigInteger];
		//		printf("======================\n");
		//		[unitTests prob16_3_sumOfDigits];
		//		printf("======================\n");
		[unitTests prob17_0_wordFormOfNumbers];
		printf("======================\n");
		[unitTests prob17_1_numFrom1to1000];
		printf("======================\n");
		[unitTests prob18_0_smallTriangle];
		printf("======================\n");
		[unitTests prob18_1_medTriangle];
	}
    return 0;
}

