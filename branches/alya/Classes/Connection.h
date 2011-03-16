//
//  Connection.h
//  Neuron1
//
//  Created by user on 10.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Neuron;

//Weighted connection to another neuron 
@interface Connection : NSObject {
	double weight; //later maybe a class, if previous weight is needed
	Neuron *connectedNeuron;
}	

-(Connection*) initWithWeight: (double) aWeight andConnectedNeuron: (Neuron*) aNeuron;	
-(Connection*) initWithWeight: (double) aWeight;	
-(Connection*) initWithFromNeuron: (Neuron*) fromNeuron;
-(Connection*) initWithFromNeuron: (Neuron*) fromNeuron andToNeuron: (Neuron*) toNeuron;
-(double) weight;
-(Neuron*) connectedNeuron;
-(double)getInput;
-(void) incWeightWith: (double) amount;
//-(double)getWeightedInput;
@end
