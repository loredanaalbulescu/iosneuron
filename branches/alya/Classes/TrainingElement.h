//
//  TrainingElement.h
//  Neuron1
//
//  Created by user on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TrainingElement : NSObject 
{
	NSMutableArray *input;
	NSString *label;
	
}
-(TrainingElement*) initWithInput: (NSMutableArray*) anInput;
//init from string of input
//init ourselves
-(NSString*) getLabel;
-(void) setLabel: (NSString*) label;
-(NSMutableArray*) input;
-(void) setInput: (NSMutableArray*) inp;

@end
