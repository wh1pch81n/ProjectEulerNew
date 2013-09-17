//
//  DHFullAdderBase10.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/21/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHHalfAdderBase10.h"

@interface DHFullAdderBase10 : DHHalfAdderBase10 {
	NSInteger _cin;
}
@property NSInteger cin;
- (id)initWithNumA:(NSInteger)numa withNumB:(NSInteger)numb withCarryIn:(NSInteger)cin;
#pragma mark - overwritten outputs
- (NSInteger)solution;
- (NSInteger)cout;
@end
