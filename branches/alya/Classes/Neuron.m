//
//  Neuron.m
//  Neuron1
//
//  Created by user on 10.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Neuron.h"
#import "Layer.h"

@implementation Neuron

-(Neuron*) init 
{
	self = [super init];
	if (self)
	{
		inputConnections = [[NSMutableArray alloc]init];
		outputConnections = [[NSMutableArray alloc]init];
		//weightsFunction
		//summingFunction
		//inputFunction
		//transferFunction
		//create Neuron from input&transfer
	}
	return self;
}

-(void) addInputConnection: (Connection*) aConnection
{
	[inputConnections addObject:aConnection];
	Neuron *connectedNeuron = [aConnection connectedNeuron];	
	Connection *backConnection = [[Connection alloc] initWithWeight:[aConnection weight] andConnectedNeuron: self];
	[connectedNeuron addOutputConnection:backConnection];
}

-(void) addOutputConnection: (Connection*) aConnection
{
	[outputConnections addObject:aConnection];
}

-(void) addInputConnectionFromNeuron: (Neuron*) aNeuron 
{
	Connection *connection = [[Connection alloc] initWithFromNeuron:aNeuron];
	[self addInputConnection: connection];
}

-(BOOL) hasInputConnections 
{
	return (inputConnections.count > 0);
}

-(NSMutableArray*) getInputConnections
{
	return inputConnections;
}

-(NSMutableArray*) getOutputConnections
{
	return outputConnections;
}

-(void) setParentalLayer: (Layer*) aLayer
{
	parentalLayer = aLayer;
}

-(void)setError:(double)anError
{
	error = anError;
}

-(Layer*) parentalLayer
{
	return parentalLayer;
}

-(void) calculate 
{
	
	if ([self hasInputConnections])
	{
		//netInput = [inputFunction getOutput:inputConnections];
	}
	//output = transferFunction getoutput:netInput;
}

-(void) reset 
{
	netInput=0;
	output = 0;	
}

-(double) output
{
	return output;
}

-(void) dealloc
{
	[inputConnections release];
	[outputConnections release];
	[super dealloc];
}
@end
