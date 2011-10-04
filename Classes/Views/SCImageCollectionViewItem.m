//
//  SCImageCollectionViewItem.m
//  ImageGallery
//
//  Created by Роман Романчук on 04.10.11.
//  Copyright 2011 Epam. All rights reserved.
//

#import "SCImageCollectionViewItem.h"

@implementation SCImageCollectionViewItem

- (id)initWithReuseIdentifier:(NSString *)aReuseIdentifier {
	if ((self = [super initWithStyle:SSCollectionViewItemStyleImage reuseIdentifier:aReuseIdentifier])) {
		self.imageView.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0f];
	}
	return self;
}

@end
