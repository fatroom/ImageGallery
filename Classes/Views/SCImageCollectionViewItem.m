//
//  SCImageCollectionViewItem.m
//  ImageGallery
//
//  Created by Роман Романчук on 04.10.11.
//  Copyright 2011 Epam. All rights reserved.
//

#import "SCImageCollectionViewItem.h"

@implementation SCImageCollectionViewItem

@synthesize owner;

- (id)initWithReuseIdentifier:(NSString *)aReuseIdentifier {
	if ((self = [super initWithStyle:SSCollectionViewItemStyleImage reuseIdentifier:aReuseIdentifier])) {
        //CGRect frame = self.imageView.frame;
        //= CGRectMake(0, 10, frame.size.width, frame.size.height-10);
        contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, 70 , 70)];
        [self addSubview:contentView];
		//self.imageView.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0f];
	}
	return self;
}

- (void)setImage:(UIImage *)image {
    [contentView setImage:image];
}

- (void)setEditMode:(BOOL)isEditMode {
    [removeBtn removeFromSuperview];
    removeBtn = nil;
    if (isEditMode) {
        removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeBtn setImage:[UIImage imageNamed:@"btn_close.png"] forState:UIControlStateNormal];
        [removeBtn addTarget:self action:@selector(deleteImage) forControlEvents:UIControlEventTouchUpInside];
        [removeBtn setFrame:CGRectMake(-10, 0, 30, 30)];
        [self addSubview:removeBtn];
    }
}

- (void) deleteImage {
    [owner removeSelectedImage:contentView.image];
}
@end
