//
//  NameScores.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 10/2/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "NameScores.h"

@implementation NameScores

/**
 Creates an array of names by parsing a file that has names of the format "NAME"
 @param fileName The name of the file that will be parsed
 @param sort if YES then the names will be sorted in the array
 @return NSArray of NSStrings
 */
+ (NSArray *)arrayOfNamesFromFile:(NSString *)fileName willSort:(BOOL)sort {
	NSString *fileContents = [NSString stringWithContentsOfFile:fileName
													   encoding:NSASCIIStringEncoding error:nil];
	NSMutableArray *marr = [NSMutableArray new];
	NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:@"\"([A-Z]*)\"(,)?"
																		   options:NSRegularExpressionCaseInsensitive
																			 error:nil];
	[regEx enumerateMatchesInString:fileContents options:0
							  range:NSMakeRange(0, fileContents.length)
						 usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
							 NSString *name = [fileContents substringWithRange:result.range];
							 [marr addObject:name];
						 }];
	if (sort) {
		[self quickSort:marr left:0 right:marr.count-1];
	}
	return marr;
}

/**
 Calculates the namescore.  Each character of the name has a numberical value.  The sub is multiplied by the names position in the array.
 @param arr The array of names.
 @return NSInteger the total name score.
 */
+ (NSInteger)calcTotalScore:(NSArray *) arr {
	NSInteger totalScore = 0;
	for (int j = 0; j < arr.count; ++j) {
		int wordScore = 0;
		for (int i = 0; i < [arr[j] length]; ++i){
			wordScore += [arr[j] characterAtIndex:i] - 'A' +1;
		}
		totalScore += (wordScore *(j+1));
	}
	return totalScore;
}

/**
 Quick sort algorithm implementation
 @param arr an array of objects
 @param left the left-most index of the array
 @param right the right-most index of the array
 */
+ (void)quickSort:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right {
	if (left >= right) {
		return;
	}
	NSInteger pivotNewIndex = [self partition:arr left:left right:right
								   pivotIndex:(left + right) >>1];
	[self quickSort:arr left:left right:pivotNewIndex-1];
	[self quickSort:arr left:pivotNewIndex+1 right:right];
}

/**
 Swaps two elements at the specified indexes
 @param arr the array
 @param a the index of the first
 @param b the index of the second object.
 */
+ (void)swap:(NSMutableArray *)arr indexA:(NSInteger)a indexB:(NSInteger)b {
	id temp = arr[a];
	arr[a] = arr[b];
	arr[b] = temp;
}

/**
 determines if string a is less than string b
 @param a first string
 @param b second string
 @return YES if a < b.  No otherwise
 */
+ (bool)nameIsLessThan:(NSString *)a :(NSString *)b {
	return [a isLessThan:b];
}

/**
 partitions the array
 @param arr the array to partition
 @param left the left-bound index
 @param right the right-bound index
 @param pivotIndex the pivot index
 @return The index of the new pivot index
 */
+ (NSInteger)partition:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right pivotIndex:(NSInteger)pivotIndex {
	NSString *pivotValue = arr[pivotIndex];
	[self swap:arr indexA:right indexB:pivotIndex];
	for (NSInteger i = left; i < right; ++i) {
		if ([self nameIsLessThan:arr[i] :pivotValue]) {
			[self swap:arr indexA:i indexB:left];
			left +=1;
		}
	}
	[self swap:arr indexA:right indexB:left];
	return left;
}
@end
