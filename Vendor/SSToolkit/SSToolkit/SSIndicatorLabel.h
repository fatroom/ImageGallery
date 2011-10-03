//
//  SSIndicatorLabel.h
//  SSToolkit
//
//  Created by Sam Soffes on 7/13/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//

/**
 This class is a nice little view that makes showing an activity indicator next to a label when loading something easy.
 
 The indicator will slide in from the left when loading and then back out when it is complete. This is great for a view
 that shows some sort of status that can refresh.
 */
@interface SSIndicatorLabel : UIView {

@private	

	UILabel *_textLabel;
	UIActivityIndicatorView *_activityIndicatorView;
	BOOL _loading;
}

/**
 Returns the label used for the main textual content of the view. (read-only)
 */
@property (nonatomic, retain, readonly) UILabel *textLabel;

/**
 A view that indicates loading activity to the user. (read-only)
 */
@property (nonatomic, retain, readonly) UIActivityIndicatorView *activityIndicatorView;

/**
 A Boolean value that determines whether the view is loading.
 
 The default value is `NO`.
 */
@property (nonatomic, assign, getter=isLoading) BOOL loading;

/**
 Starts loading and updates the text of the text label.
 
 @param text String to update the `textLabel`'s `text` property to.
 */
- (void)startWithText:(NSString *)text;

/**
 Completes loading and updates the text of the text label.
 
 @param text String to update the `textLabel`'s `text` property to.
 */
- (void)completeWithText:(NSString *)text;

@end
