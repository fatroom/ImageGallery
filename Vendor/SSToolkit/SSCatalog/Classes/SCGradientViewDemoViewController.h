//
//  SCGradientViewDemoViewController.h
//  SSCatalog
//
//  Created by Sam Soffes on 10/27/09.
//  Copyright 2009 Sam Soffes, Inc. All rights reserved.
//

@interface SCGradientViewDemoViewController : UIViewController {

@private
	
	BOOL _blue;
	SSGradientView *_gradientView;
}

+ (NSString *)title;

- (void)changeColor:(id)sender;
- (void)updateScale:(id)sender;

@end
