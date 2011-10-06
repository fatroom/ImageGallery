//
//  PhotoGridController.h
//  ImageGallery
//
//  Created by Роман Романчук on 04.10.11.
//  Copyright 2011 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoGridController :  SSCollectionViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    BOOL isEditMode;
    
}

@property (readonly) UIButton *btn;
@property (retain) NSMutableArray *images;

@end
