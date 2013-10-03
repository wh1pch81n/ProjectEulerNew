//
//  NameScores.m
//  ProjectEulerNew
//
//  Created by Derrick Ho on 10/2/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "NameScores.h"

@implementation NameScores
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

+ (void)quickSort:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right {
	if (left >= right) {
		return;
	}
	NSInteger pivotNewIndex = [self partition:arr left:left right:right
								   pivotIndex:(left + right) >>1];
	[self quickSort:arr left:left right:pivotNewIndex-1];
	[self quickSort:arr left:pivotNewIndex+1 right:right];
}
+ (void)swap:(NSMutableArray *)arr indexA:(NSInteger)a indexB:(NSInteger)b {
	id temp = arr[a];
	arr[a] = arr[b];
	arr[b] = temp;
}
+ (bool)nameIsLessThan:(NSString *)a :(NSString *)b {
	return [a isLessThan:b];
}
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
