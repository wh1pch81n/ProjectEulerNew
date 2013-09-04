//
//  TrianglePaths.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 9/4/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "TrianglePaths.h"

@implementation TrianglePaths
- (NSInteger)maxPathSumWIthTriangle:(NSMutableArray *)tri {
	if (!tri) {
		return 0;
	}
	
	NSMutableArray *mergedArray =tri;
	for (int row = (int)mergedArray.count-1; row > 0; --row) {
		for (int col = 0; col < [mergedArray[row -1] count]; ++col) {
			if ([mergedArray[row][col] integerValue] > [mergedArray[row][col+1] integerValue])
				mergedArray[row-1][col] = [@([mergedArray[row-1][col] integerValue] + [mergedArray[row][col] integerValue]) stringValue];
			else
				mergedArray[row-1][col] = [@([mergedArray[row-1][col] integerValue] + [mergedArray[row][col+1] integerValue]) stringValue];
		}
	}
	return [[mergedArray objectAtIndex:0][0] integerValue];
}
@end
