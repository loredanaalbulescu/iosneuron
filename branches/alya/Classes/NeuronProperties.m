//
//  NeuronProperties.m
//  Neuron1
//
//  Created by user on 28.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NeuronProperties.h"


@implementation NeuronProperties
-(id) init 
{
	self = [super init];
	if (self) 
	{
		NSArray *keys = [[NSArray alloc] initWithObjects:@"weightsFunction", @"summingFunction", @"transferFunction", @"neuronType", @"useBias", nil];
		properties = [[NSMutableDictionary alloc] init];
		for (id key in keys) 
		{
			[properties setValue:@"" forKey:key];
		}
		
		[properties setValue:@"WeightedInput" forKey:@"weightsFunction"];
		[properties setValue:@"Sum" forKey:@"summingFunction"];
		[properties setValue:@"transferFunctionType.getTypeClass" forKey:@"transferFunction"];
		[properties setValue:@"Neuron" forKey:@"neuronType"];
		//[properties setValue:YES forKey:@"useBias"];
		[properties setValue:@"YES" forKey:@"useBias"];
		//the same for the rest keys
		[keys release];
	}
	return self;
}

//-(WeightsFunction*) getWeightsFunction 
//{
//	return [[NSClassFromString(@"NameofClass") alloc] init];
//}

-(void) dealloc 
{
	[properties release];
	[super dealloc];
}

@end
