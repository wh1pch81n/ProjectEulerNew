//
//  DHFullAdderBase10.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/21/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "DHHalfAdderBase10.h"

@interface DHFullAdderBase10 : DHHalfAdderBase10 {
	NSNumber *_cin;
}
- (id)initWithNumA:(NSNumber *)numa withNumB:(NSNumber *)numb withCarryIn:(NSNumber *)cin;
@end
