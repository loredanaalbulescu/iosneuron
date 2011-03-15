//
//  Connection.m
//  Neuron1
//
//  Created by user on 10.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Connection.h"
#import "Neuron.h"

@implementation Connection

-(Connection*) initWithWeight: (double) aWeight andConnectedNeuron: (Neuron*) aNeuron	
{
	self = [super init];
	if (self)
	{
		weight=aWeight;
		connectedNeuron = aNeuron;
		//[ self setWeight:w andConnectedNeuron:n];
	}
	return self;
}

-(Connection*) initWithFromNeuron: (Neuron*) fromNeuron
{
	connectedNeuron = fromNeuron;
	//weight = 0; //newWeight
	return self;
}

-(Neuron*) connectedNeuron 
{
	return connectedNeuron;
}


-(double) weight 
{
	return weight;
}

-(Connection*) initWithFromNeuron: (Neuron*) fromNeuron andToNeuron: (Neuron*) toNeuron 
{
	self = [super init];
	if (self) 	
	{
		connectedNeuron = toNeuron;
		[fromNeuron addInputConnection:self];
	//weight = random()-0.5;
	}
	return self;
}

-(double) getInput
{
	return [connectedNeuron output];
}

-(void) incWeightWith: (double) amount
{
	weight +=amount;
}

@end
