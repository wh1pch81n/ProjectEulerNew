//
//  DHHalfAdder.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/18/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger kBase;

@interface DHHalfAdderBase10 : NSObject {
	NSInteger _numa;
	NSInteger _numb;
}
@property NSInteger numa;
@property NSInteger numb;
- (id)initWithNumA:(NSInteger)numa withNumB:(NSInteger)numb;
#pragma mark - outputs
- (NSInteger)solution;
- (NSInteger)cout;
@end

