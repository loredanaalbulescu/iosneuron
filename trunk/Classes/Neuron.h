//
//  Neuron.h
//  Neuron1
//
//  Created by user on 10.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Connection.h"
#import "TransferFunction.h"
@class Layer;

@interface Neuron : NSObject {
	Layer *parentalLayer;
	NSMutableArray *inputConnections;
	NSMutableArray *outputConnections;
	TransferFunction *transferFunction;
	//transferFunction;
	double netInput;
	double output;
	double error;
	
}
-(Neuron*) init;
//-(Neuron*) initWithInputFunction andOutputFunction
-(void) calculate;
-(void) reset;
-(void) setInput: (double) anInput;
-(double) netInput;
-(double) output;
-(BOOL) hasInputConnections;
//getInputIterator;
-(void) addInputConnection: (Connection*) aConnection;
-(void) addInputConnectionFromNeuron: (Neuron*) aNeuron;
//-(void) addInputConnection: (Neuron*) aNeuron andWeight: (double) aWeight;
-(void) addOutputConnection: (Connection*) aConnection;
-(NSMutableArray*) getInputConnections;
-(NSMutableArray*) getOutputConnections;
-(void) removeInputConnectionFrom: (Neuron*) aNeuron;
-(Connection*) getConnectionFrom: (Neuron*) aNeuron;
//setInputFunction
//setTransferFunction
//getInputFunction
//getTrancferFunction
-(void) setParentalLayer: (Layer*) aLayer;
-(Layer*) parentalLayer;
//getWeightsVector
-(double) getError;
-(void)setError:(double)anError;
//setOutput
//randomizeInputWeights
//initializeWeights

@end
