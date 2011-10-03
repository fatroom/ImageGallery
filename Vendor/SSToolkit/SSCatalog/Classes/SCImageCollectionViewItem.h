//
//  SCImageCollectionViewItem.h
//  SSCatalog
//
//  Created by Sam Soffes on 5/3/11.
//  Copyright 2011 Sam Soffes. All rights reserved.
//

@interface SCImageCollectionViewItem : SSCollectionViewItem {

@private
	
	NSURL *_imageURL;
}

@property (nonatomic, retain) NSURL *imageURL;

- (id)initWithReuseIdentifier:(NSString *)aReuseIdentifier;

@end
