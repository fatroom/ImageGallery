//
//  SCImageCollectionViewItem.h
//  ImageGallery
//
//  Created by Роман Романчук on 04.10.11.
//  Copyright 2011 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCImageCollectionViewItem : SSCollectionViewItem {
    UIButton *removeBtn;
    UIImageView *contentView;
    
}

@property (assign) id owner;

- (id)initWithReuseIdentifier:(NSString *)aReuseIdentifier;
- (void)setImage:(UIImage *)image;
- (void)setEditMode:(BOOL)isEditMode;
@end
