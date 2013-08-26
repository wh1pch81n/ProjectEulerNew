//
//  DHAdder_protocol.h
//  ProjectEulerNew
//
//  Created by Derrick Ho on 8/22/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

/*All subclasses are required to implemente these methods listed in protocol*/
@protocol DHAdder_protocol <NSObject>
@required
#pragma mark - sum of inputs
- (NSInteger)sumOfInputs;
@end