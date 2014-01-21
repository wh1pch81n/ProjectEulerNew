//
//  FactorialGen.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 1/20/14.
//  Copyright (c) 2014 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactorialGen : NSObject {
	NSMutableArray *arrTree;
	//NSMutableString *runningPerm;
}
- (id)init;
- (id)initWithString:(NSString *)str;
- (NSArray *)arrayOfPermutations;
@end
