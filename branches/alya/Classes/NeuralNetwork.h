//
//  NeuralNetwork.h
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Layer.h"
#import "LearningRule.h"

@interface NeuralNetwork : NSObject {
	//NeuralNetworkType type;
	NSMutableArray *layers;
	NSMutableArray *inputNeurons;
	NSMutableArray *outputNeurons;
	LearningRule *learningRule;
	//
}

-(void) addLayer: (Layer*) aLayer;
//-(void) addLayer: (Layer*) aLayer andIndex: (int) anIndex;
-(void) removeLayer: (Layer*) aLayer;
-(void) removeLayerAt: (Layer*) aLayer andIndex: (int) anIndex;
//getLayersIterator
-(NSMutableArray*) getLayers;
-(Layer*) getLayerAt: (int) anIndex;
-(int) indexOfLayer: (Layer*) layer;
-(int) getLayersCount;
-(void) setInput: (NSMutableArray*) inputVector; //vectorSizeMismatchException
-(NSMutableArray*) getOutput;
-(void) calculate;
-(void) reset;
-(void) learnFromSet: (TrainingSet *)aTrainingSet;//threadinghere
-(void) stopLearning;
//pauseLearning
//resumeLearning
//randomizeweights
-(void) initializeWeightsWithValue: (double) value;
//getNetworkType
//setNetworkType
//getInputNeurons
//setInputNeurons
-(NSMutableArray*) outputNeurons;
//setOutputNeurons
-(void) setLearningRule: (LearningRule*) aRule;
-(LearningRule*) learningRule;
//notifyChange
//createConnection
//save
//load


@end
