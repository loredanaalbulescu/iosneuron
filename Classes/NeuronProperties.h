//
//  NeuronProperties.h
//  Neuron1
//
//  Created by user on 28.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeightsFunction.h";

@interface NeuronProperties : NSObject {
	NSMutableDictionary *properties;
	
}
-(id) init;
-(void) setPropertyfromKey: (NSString*) aKey andValue: (id) aValue;
-(id) getProperty: (NSString*) key;
-(BOOL) hasProperty: (NSString*) key;
-(WeightsFunction*) getWeightsFunction;
//id object = [[NSClassFromString(@"NameofClass") alloc] init];

@end
