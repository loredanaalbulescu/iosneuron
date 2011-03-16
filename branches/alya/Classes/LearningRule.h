//
//  LearningRule.h
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrainingSet.h"
@class NeuralNetwork;
@class Neuron;

@interface LearningRule : NSObject
{
	NeuralNetwork *neuralNetwork;
	TrainingSet *trainingSet;
	BOOL stopLearning;
	double learningRate;
	int maxIterations;
	BOOL iterationsLimited;
	int currentIteration;
	double maxError;
	double minErrorChange;
	int minErrorChangeIterationsLimit;
	int minErrorChangeIterationsCount;
	double previousEpochError;
	double totalNetworkError;

}


-(LearningRule*) initWithNeuralNetwork: (NeuralNetwork*) aNeuralNetwork;
-(void) setTrainingSet: (TrainingSet*) aTrainingSet;
//-(TrainingSet*) getTrainingSet;
-(void) setNeuralNetwork: (NeuralNetwork*) aNeuralNetwork;
//-(NeuralNetwork*) getNeuralNetwork;
-(NSMutableArray*)getPatternErrorFromOutput:(NSMutableArray*)output andDesiredOutput: (NSMutableArray*) desiredOutput;
-(void) updateTotalNetworkError: (NSMutableArray*) patternError;

-(void) updateNetworkWeights: (NSMutableArray*) patternError;


-(void) setLearningRate:(double) rate;
-(void) setMaxIterations:(int)iterations;
-(void) run;
-(void) setMaxError:(double) error;
//abstract learn: (TrainigSet*) aTrainingSet;
-(void) learn: (TrainingSet*) aTrainingSet;
-(void) reset;
-(void) doLearningEpoch: (TrainingSet*) aTrainingSet;
-(void) learnPattern: (SupervisedTrainingElement*) trainingElement;
//notifyChange
-(void) stopLearning;
-(BOOL) hasReachedStopCondition;
-(BOOL) errorChangeStalled;
//isStopped

@end
