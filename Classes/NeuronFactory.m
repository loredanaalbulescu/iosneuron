//
//  NeuronFactory.m
//  Neuron1
//
//  Created by user on 28.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NeuronFactory.h"


@implementation NeuronFactory
-(Neuron*) createNeuron: (NeuronProperties*) properties
{
	Neuron *neuron = [[Neuron alloc] init];
	//dealloc where?
	//constructor with inputFunction&transferFunction
	//hasproperty threshold
	//hasproperty bias
	return neuron;
}
@end
