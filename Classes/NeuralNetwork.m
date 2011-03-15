//
//  NeuralNetwork.m
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NeuralNetwork.h"


@implementation NeuralNetwork
-(NeuralNetwork*) init
{
	self = [super init];
	if (self)
	{
		layers = [[NSMutableArray alloc] init];
		inputNeurons = [[NSMutableArray alloc] init];
		outputNeurons = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void) addLayer: (Layer*) aLayer
{
	[aLayer setParentalNetwork: self];
	[layers addObject:aLayer];
}

-(void) setLearningRule: (LearningRule*) aRule
{
	[learningRule setNeuralNetwork:self];
	learningRule = aRule;
}

-(LearningRule*) learningRule
{
	return learningRule;
}

-(void) learnFromSet: (TrainingSet *)aTrainingSet
{
	[learningRule setTrainingSet:aTrainingSet];
	[learningRule run];
}

-(void) calculate
{
	for (Layer* layer in layers)
	{
		[layer calculate];
	}
}

-(NSMutableArray*) getOutput
{
	NSMutableArray *outputVector = [[NSMutableArray alloc] init];
	for (Neuron *neuron in outputNeurons)
	{
		double output = [neuron output];
		NSNumber *num = [NSNumber numberWithDouble:output];
		[outputVector addObject:num];
	}
	return outputVector;
}

-(NSMutableArray*) outputNeurons
{
	return outputNeurons;
}

-(Layer*) getLayerAt: (int) anIndex
{
	return [layers objectAtIndex:(NSUInteger)anIndex];
}

-(int) getLayersCount
{
	return [layers count];
}

-(void) dealloc
{
	[layers release];
	[inputNeurons release];
	[outputNeurons release];
	[super dealloc];
}
@end
