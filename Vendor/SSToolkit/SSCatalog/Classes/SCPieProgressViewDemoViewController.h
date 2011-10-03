//
//  SCPieProgressViewDemoViewController.h
//  SSCatalog
//
//  Created by Sam Soffes on 4/22/10.
//  Copyright 2010 Sam Soffes, Inc. All rights reserved.
//

@interface SCPieProgressViewDemoViewController : UIViewController {

@private
	
	SSPieProgressView *_progressView7;
	NSTimer *_timer;
}

+ (NSString *)title;

- (void)incrementProgress:(NSTimer *)timer;

@end
