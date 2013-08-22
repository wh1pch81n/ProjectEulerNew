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
		[unitTests prob16_0_halfAdder];
		printf("======================\n");
		[unitTests prob16_1_fullAdder];
	}
    return 0;
}

