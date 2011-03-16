//
//  MultiLayerPerceptron.m
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MultiLayerPerceptron.h"
#import "ConnectionFactory.h"
#import "NeuronProperties.h"
#import "BackPropagation.h"

@implementation MultiLayerPerceptron
-(MultiLayerPerceptron*) initWithNeuronsInLayers: (NSMutableArray*) neuronsInLayers
{
	self = [super init];
	if (self)
	{
		//TODO: create MLP network using neuronProperties
		//I have decided we do not need it for now,
		//we'll have just useBias & sigmoid	
		//NeuronProperties *properties = [[NeuronProperties alloc] init];
		//[properties setPropertyfromKey:@"useBias" andValue:YES];
		//transfer function - sigmoid
		[self createNetwork: neuronsInLayers];
	}
	return self;
}

-(void) createNetwork: (NSMutableArray*) neuronsInLayers 
{
	//TODO: setNetwork type to MULTI_LAYER_PERCEPTRON
	//create layer (number, inpProp)
	//creating the first layer
	//the difference between the first layer and the other layers is that
	//the first layer has linear transfer function,
	//while the others have sigmoid transfer function
	int neuronsInLayer = [[neuronsInLayers objectAtIndex: 0] intValue];
	//should be done in layerFactory
	//the layer is to be created with all the neurons and neuronProperties
	Layer *layer = [[Layer alloc] initWithLayerNeuronCount: neuronsInLayer];
	BOOL useBias = YES;
	//check if it is initialized in properties, then use that value
	if (useBias) 
	{
		//this should be a Bias type of Neuron
		Neuron *n = [[Neuron alloc]init];
		[layer addNeuron:n];
		//[layer addNeuron:[[Neuron alloc]init]];
	}
	[self addLayer:layer];
	Layer *prevLayer = layer;
	for (int layerIndex=1; layerIndex<neuronsInLayers.count; layerIndex++) 
	{
		neuronsInLayer = [[neuronsInLayers objectAtIndex: layerIndex] intValue];
		layer = [[Layer alloc] initWithLayerNeuronCount: neuronsInLayer];
		//if useBias is true and it is not the last layer
		if (useBias && (layerIndex<neuronsInLayers.count-1)) 
		{
			[layer addNeuron:[[Neuron alloc]init]];
		}
		[self addLayer:layer];
		if (prevLayer) 
		{
			[ConnectionFactory fullConnectPrevLayer: prevLayer andThisLayer: layer];
		}
		prevLayer=layer;
	}
	[self setLearningRule:[[BackPropagation alloc]init]];
}

-(void) dealloc 
{
	//layer release?
	[super dealloc];
}
@end
