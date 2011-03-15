//
//  InputFunction.m
//  Neuron1
//
//  Created by user on 08.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InputFunction.h"


@implementation InputFunction
-(id) init 
{
	self = [super init];
	if (self) 
	{
		//here it must be another thing!!!!!!!
		[weightsFunction init];
		[summingFunction init];
	}
	return self;
}

-(id) initWithWeightsFunction: (WeightsFunction*) aWeightsFunction andSummingFunction: (SummingFunction*) aSummingFunction 
{
	self = [super init];
	if (self) 
	{
		weightsFunction = aWeightsFunction;
		summingFunction = aSummingFunction;
	}
	return self;
}

-(double) getOutput:(NSMutableArray*) inputConnections 
{
	NSMutableArray * input = [weightsFunction getOutput: inputConnections];
	double output = [summingFunction getOutput: input];
	return output;
}

-(void) dealloc
{
	[weightsFunction release];
	[summingFunction release];
	[super dealloc];
}
@end
