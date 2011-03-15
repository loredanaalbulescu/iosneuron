//
//  Sigmoid.m
//  Neuron1
//
//  Created by user on 14.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sigmoid.h"
//#import "math.h"

@implementation Sigmoid
+(double) getOutputFrom: (double) net
{
	double den = (double) (1 + exp(-slope * net));
	return (1 / den);
}

+(double) getDerivative: (double) net
{
	double out = [self getOutputFrom:net];
	return slope * out * (1 - out);
}
@end
