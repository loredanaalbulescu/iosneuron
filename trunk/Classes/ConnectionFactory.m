//
//  ConnectionFactory.m
//  Neuron1
//
//  Created by user on 01.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ConnectionFactory.h"


@implementation ConnectionFactory
+(void) createConnectionFromNeuron: (Neuron*) neuronFrom  toNeuron: (Neuron*) neuronTo 
{
	Connection *connection = [[Connection alloc] initWithFromNeuron:neuronFrom];
	[neuronTo addInputConnection:connection];
}

+(void) fullConnectPrevLayer: (Layer*) fromLayer andThisLayer: (Layer*) toLayer 
{
	for (Neuron *from in [fromLayer neurons])
	{
		for (Neuron *to in [toLayer neurons]) 
		{
			[self createConnectionFromNeuron: from toNeuron: to];
		}
	}
}
@end
