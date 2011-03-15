//
//  Layer.m
//  Neuron1
//
//  Created by user on 26.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Layer.h"
#import "NeuralNetwork.h"

@implementation Layer
-(id) init
{
	self = [super init];
	if (self)
	{
		neurons = [[NSMutableArray alloc] init];
	}
	return self;
}

-(id)initWithLayerNeuronCount:(int) neuronsInLayer 
{
	self = [self init];
	if (self)
	{
		for (int i=0; i<neuronsInLayer; i++) 
		{
			//now i need to implement init from neuronproperties for neuron!
			//this thing should be in NeuronFactory as -(Neuron*)createNeuron;
			Neuron *neuron = [[Neuron alloc] init];
			[self addNeuron:neuron];
		}
	}
	return self;
}


-(void) addNeuron: (Neuron*) neuron 
{
	[neuron setParentalLayer: self];
	[neurons addObject: neuron];
}

-(void) setParentalNetwork: (NeuralNetwork*) aNetwork
{
	parentNetwork = aNetwork;
}

-(NSMutableArray*) neurons 
{
	return neurons;
}

-(void) calculate
{
	for (Neuron* neuron in neurons)
	{
		[neuron calculate];
	}
}

-(void) dealloc
{
	[neurons release];
	[parentNetwork release];
	[super dealloc];
}
@end
