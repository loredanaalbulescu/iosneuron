//
//  BackPropagation.m
//  Neuron1
//
//  Created by user on 11.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BackPropagation.h"
#import "Connection.h"
#import "Neuron.h"
#import "NeuralNetwork.h"

@implementation BackPropagation
-(void) updateNetworkWeights: (NSMutableArray*) patternError
{
	[self adjustOutputNeurons : patternError];
	[self adjustHiddenLayers];
}
-(void) adjustOutputNeurons: (NSMutableArray*) patternError
{
	int i = 0;
	
	for(Neuron *neuron in [neuralNetwork outputNeurons])
	{
		double outputError = [[patternError objectAtIndex:(NSUInteger)i] doubleValue];
		if (outputError == 0) 
		{
			[neuron setError:0];
			i++;
			continue;
		}
		
		//TransferFunction *transferFunction = [neuron getTransferFunction];
		double neuronInput = [neuron netInput];
		//double delta = outputError * [transferFunction getDerivative:neuronInput];
		double derivative = [Sigmoid getDerivative:neuronInput];
		double delta = outputError * derivative;
		[neuron setError:delta];
		[self updateNeuronWeights:neuron];				
		i++;
	} 
}
-(void) adjustHiddenLayers
{
	int layerNum = [neuralNetwork getLayersCount];
	
	for (int i = layerNum - 2; i > 0; i--) 
	{
		Layer *layer = [neuralNetwork getLayerAt:i];
		
		for(Neuron *neuron in [layer neurons]) 
		{	
			double delta = [self calculateDelta:neuron];
			[neuron setError:delta];
			[self updateNeuronWeights:neuron];
		}
	}  
}
-(void) updateNeuronWeights:(Neuron*) neuron
{
	// get the error for specified neuron
	double neuronError = [neuron getError];
	NSMutableArray *inputConnections = [neuron getInputConnections];
	Connection *connection;
	int inputConnectionsCount = [inputConnections count];
	// iterate through all neuron's input connections
	for(int i = 0; i < inputConnectionsCount; i++)
	{
		connection =(Connection*)[inputConnections objectAtIndex:(NSUInteger)i];
		// get the input from current connection
		double input = [connection getInput];
		// calculate the weight change
		double deltaWeight = learningRate * neuronError * input;
		// apply the weight change
		[connection incWeightWith:deltaWeight];
	}
}
-(double) calculateDelta:(Neuron *)aNeuron
{
	NSMutableArray *connectedTo = [aNeuron getOutputConnections];
	
	double delta_sum = 0;
	for(Connection *connection in connectedTo)
	{	
		double d = [[connection connectedNeuron] getError] * [connection weight];
		delta_sum += d; // weighted sum from the next layer
	} // for
	
	//TransferFunction *transferFunction = [aNeuron getTransferFunction];
	double netInput = [aNeuron netInput];
	//double f1 = [transferFunction getDerivative:netInput];
	double f1 = [Sigmoid getDerivative:netInput];
	double delta = f1 * delta_sum;
	return delta;
}
@end
