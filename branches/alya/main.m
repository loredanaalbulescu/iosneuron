//
//  main.m
//  Neuron1
//
//  Created by user on 07.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiLayerPerceptron.h"
#import "SupervisedTrainingElement.h"

int main(int argc, char *argv[]) 
{
    
    //NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    //int retVal = UIApplicationMain(argc, argv, nil, nil);
	//NSArray *neuronsCountArray = [[NSArray alloc] initWithObjects: 4,9,1, nil ];
	NSMutableArray *neuronsCount = [[NSMutableArray alloc] initWithObjects:@"4",@"9",@"1",nil];
	
	int maxIterations = 10000;
	//addObjectsFromArray:neuronsCountArray
	NeuralNetwork *mlp = [[MultiLayerPerceptron alloc]initWithNeuronsInLayers:neuronsCount];
	[[mlp learningRule] setMaxError:0.001];
	[[mlp learningRule] setLearningRate:0.07];
	[[mlp learningRule] setMaxIterations:maxIterations];
	
	double daxmax = 10000.0;
	TrainingSet *trainingSet;// = [TrainingSet]
	NSMutableArray *inputArray = [[NSMutableArray alloc] initWithObjects: [NSNumber numberWithDouble:(3710.0 / daxmax)], [NSNumber numberWithDouble:(3690.0 /daxmax) ], [NSNumber numberWithDouble:(3890.0 / daxmax)], [NSNumber numberWithDouble:(3695.0 / daxmax)], nil];
	NSMutableArray *outputArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithDouble:3666.0 / daxmax ],nil];
	SupervisedTrainingElement *supervisedTrainigElement;
	[trainingSet addElement:[supervisedTrainigElement initWithInput:inputArray andDesiredOutput: outputArray]];
	
	[inputArray replaceObjectAtIndex: 0 withObject:[NSNumber numberWithDouble:(3690.0 / daxmax)]];
	[inputArray replaceObjectAtIndex: 1 withObject:[NSNumber numberWithDouble:(3890.0 / daxmax)]];
	[inputArray replaceObjectAtIndex: 2 withObject:[NSNumber numberWithDouble:(3695.0 / daxmax)]];
	[inputArray replaceObjectAtIndex: 3 withObject:[NSNumber numberWithDouble:(3666.0 / daxmax)]];
	[outputArray replaceObjectAtIndex: 0 withObject:[NSNumber numberWithDouble:(3692.0 / daxmax)]];
	[trainingSet addElement:[supervisedTrainigElement initWithInput:inputArray andDesiredOutput: outputArray]];
	
	[neuronsCount release];
	[mlp release];
	return 0;
	//[pool release];
    //return retVal;
}
