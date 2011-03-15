//
//  LearningRule.m
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LearningRule.h"
#import "NeuralNetwork.h"
//maybe it should be #import "Neuron.h"
//but i suppose it is in NeuralNetwork

@implementation LearningRule

-(id) init
{
	self = [super init];
	if (self)
	{
		maxError = 0.01;
		minErrorChange = DBL_MAX;
		minErrorChangeIterationsLimit = INT_MAX;
	}
	return self;
}

-(void) setLearningRate:(double) rate
{
	learningRate = rate;
}

-(void) setMaxIterations:(int)iterations
{
	maxIterations = iterations;
	iterationsLimited = YES;
}

-(void) setNeuralNetwork: (NeuralNetwork*) aNeuralNetwork
{
	neuralNetwork = aNeuralNetwork;
}

-(void) run
{
	stopLearning = NO;
	[self learn:trainingSet];
}

//iterative learning java class
-(void) learn:(TrainingSet *)aTrainingSet
{
	[self reset];
	while (!stopLearning) 
	{
		[self doLearningEpoch: aTrainingSet];
		currentIteration++;
		if (iterationsLimited && currentIteration==maxIterations)
		{
			[self stopLearning];
		}
		else if (!iterationsLimited && (currentIteration == INT_MAX))
		{
			currentIteration = 1;
		}
		//[self notifyChange];//not implemented, maybe i do not need it
		//thread things		
	}
}

-(void) doLearningEpoch:(TrainingSet *)aTrainingSet
{
	previousEpochError = totalNetworkError;
	totalNetworkError = 0;
	NSEnumerator * enumerator = [aTrainingSet enumerator];
	TrainingElement *element ;
	while ((element = [enumerator nextObject]) && !stopLearning)
	{
		if ([element isKindOfClass:[SupervisedTrainingElement class]])
		{
			SupervisedTrainingElement *supervisedTrainingElement = (SupervisedTrainingElement*)element;
			[self learnPattern:supervisedTrainingElement];
		}
	}
	if ([self hasReachedStopCondition])
	{
		[self stopLearning];
	}
}

-(void) learnPattern: (SupervisedTrainingElement*) trainingElement
{
	NSMutableArray *input = [trainingElement input];
	[neuralNetwork setInput: input];
	[neuralNetwork calculate];
	NSMutableArray *output = [neuralNetwork getOutput];
	NSMutableArray *desiredOutput = [trainingElement desiredOutput];
	NSMutableArray *patternError = [self getPatternErrorFromOutput:output andDesiredOutput: desiredOutput];
	[self updateTotalNetworkError: patternError];
	[self updateNetworkWeights: patternError];	
}

-(void) stopLearning
{
	stopLearning = YES;
}

-(BOOL) hasReachedStopCondition
{
	return ((totalNetworkError<maxError) || [self errorChangeStalled]);	
}

-(BOOL) errorChangeStalled
{
	double absErrorChange = fabs(previousEpochError - totalNetworkError);
	
	if (absErrorChange <= minErrorChange)  
	{
		minErrorChangeIterationsCount++;
		
		if (minErrorChangeIterationsCount >= minErrorChangeIterationsLimit) 
		{
			return YES;
		}
	} else 
	{
		minErrorChangeIterationsCount = 0;
	}
	
	return NO;
}

-(void) setMaxError:(double) error
{
	maxError = error;
}

-(void) reset
{
	currentIteration = 0;
}

-(NSMutableArray*)getPatternErrorFromOutput:(NSMutableArray*)output andDesiredOutput: (NSMutableArray*) desiredOutput
{
	NSMutableArray *patternError = [[NSMutableArray alloc] init];
	double outputError = 0;
	for(int i = 0; i < [output count]; i++) 
	{
		outputError = [[desiredOutput objectAtIndex:(NSUInteger)i] doubleValue] - [[output objectAtIndex:(NSUInteger)i] doubleValue];
		[patternError addObject: [NSNumber numberWithDouble:outputError]]		;
	}
	
	return patternError;
}

-(void) updateTotalNetworkError: (NSMutableArray*) patternError
{
	double sqrErrorSum = 0;
	double error = 0;
	int patternErrorCount = [patternError count];
	for (int i=0; i<patternErrorCount; i++) 
	{
		error = [[patternError objectAtIndex:(NSUInteger)i] doubleValue];
		sqrErrorSum += (error * error);
	}
	totalNetworkError += sqrErrorSum / (2*patternErrorCount);
}



@end
