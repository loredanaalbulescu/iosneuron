//
//  InputFunction.h
//  Neuron1
//
//  Created by user on 08.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeightsFunction.h";
#import "SummingFunction.h"

@interface InputFunction : NSObject {
	WeightsFunction *weightsFunction;
	SummingFunction *summingFunction;	
}
-(id) init;
-(id) initWithWeightsFunction: (WeightsFunction*) aWeightsFunction andSummingFunction: (SummingFunction*) aSummingFunction;
-(double) getOutput:(NSMutableArray*) inputConnections;

@end
