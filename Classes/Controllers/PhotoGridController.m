//
//  PhotoGridController.m
//  ImageGallery
//
//  Created by Роман Романчук on 04.10.11.
//  Copyright 2011 Epam. All rights reserved.
//

#import "PhotoGridController.h"
#import "SCImageCollectionViewItem.h"

@implementation PhotoGridController

@synthesize btn = _btn;
@synthesize photoButton = _photoButton;
@synthesize images;

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    self.images = [NSMutableArray array];
    
   	isEditMode = NO;
	self.collectionView.extremitiesStyle = SSCollectionViewExtremitiesStyleScrolling;
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(0, 0, 75, 35);    
    [_btn setBackgroundImage:[UIImage imageNamed:@"btn_edit.png"] forState:UIControlStateNormal];
    [_btn setTitle:@"Edit" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(switchBetweenEditMode:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *button;
	button = [[UIBarButtonItem alloc] initWithCustomView:_btn];
	self.navigationItem.rightBarButtonItem = button;
    [button release];
    
    button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_photo.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pickupPhoto)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self setToolbarItems:[NSArray arrayWithObjects:flexibleSpace,button,flexibleSpace, nil]];
    _photoButton = button;
    [flexibleSpace release];
    [button release];
}

-(void)viewWillAppear:(BOOL)animated {
    NSArray *selectedImage = [NSArray arrayWithArray:self.images];
    [self.images removeAllObjects];
    NSArray *serializedImages = [[NSUserDefaults standardUserDefaults]  arrayForKey:@"storedImages"];
    for (NSData *serializedImage in serializedImages) {
        UIImage *image = [UIImage imageWithData:serializedImage];
        [self.images addObject:image];
    }
    [self.images addObjectsFromArray:selectedImage];
    [self.view reloadData];
}

-(void)viewDidDisappear:(BOOL)animated {
    NSMutableArray *serializedImages = [NSMutableArray array];
    for (UIImage *img in self.images) {
        NSData *serializedImage = UIImagePNGRepresentation(img);
        [serializedImages addObject:serializedImage];
    }
    [[NSUserDefaults standardUserDefaults] setObject:serializedImages forKey:@"storedImages"];
    [self.images removeAllObjects];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
	}
	return YES;
}


#pragma mark -
#pragma mark SSCollectionViewDataSource

- (NSUInteger)numberOfSectionsInCollectionView:(SSCollectionView *)aCollectionView {
	return 1;
}


- (NSUInteger)collectionView:(SSCollectionView *)aCollectionView numberOfItemsInSection:(NSUInteger)section {
	return [images count];
}


- (SSCollectionViewItem *)collectionView:(SSCollectionView *)aCollectionView itemForIndexPath:(NSIndexPath *)indexPath {
	static NSString *const itemIdentifier = @"itemIdentifier";
	
	SCImageCollectionViewItem *item = (SCImageCollectionViewItem *)[aCollectionView dequeueReusableItemWithIdentifier:itemIdentifier];
	if (item == nil) {
		item = [[[SCImageCollectionViewItem alloc] initWithReuseIdentifier:itemIdentifier] autorelease];
	}	
    [item setImage:[images objectAtIndex:indexPath.row]];
    [item setEditMode:isEditMode];
    [item setOwner:self];
//	CGFloat size = 80.0f * [[UIScreen mainScreen] scale];
//	NSInteger i = (50 * indexPath.section) + indexPath.row;
	
	return item;
}

/*
- (UIView *)collectionView:(SSCollectionView *)aCollectionView viewForHeaderInSection:(NSUInteger)section {
    return nil;
	SSLabel *header = [[SSLabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 40.0f)];
	header.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	header.text = @" ";
    //[NSString stringWithFormat:@"Section %i", section + 1];
	header.textEdgeInsets = UIEdgeInsetsMake(0.0f, 19.0f, 0.0f, 19.0f);
	header.shadowColor = [UIColor whiteColor];
	header.shadowOffset = CGSizeMake(0.0f, 1.0f);
	header.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
	return [header autorelease];
}*/


#pragma mark -
#pragma mark SSCollectionViewDelegate

- (CGSize)collectionView:(SSCollectionView *)aCollectionView itemSizeForSection:(NSUInteger)section {
	return CGSizeMake(80.0f, 90.0f);
}

/*
- (void)collectionView:(SSCollectionView *)aCollectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSString *title = [NSString stringWithFormat:@"You selected item %i in section %i!",
					   indexPath.row + 1, indexPath.section + 1];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil
										  cancelButtonTitle:@"Oh, awesome!" otherButtonTitles:nil];
	[alert show];
	[alert release];
}*/


- (CGFloat)collectionView:(SSCollectionView *)aCollectionView heightForHeaderInSection:(NSUInteger)section {
	return 40.0f;
}

-(void)switchBetweenEditMode:(UIBarButtonItem *)sender {
    if (isEditMode) {
        [self.btn setTitle:@"Edit" forState:UIControlStateNormal];
        isEditMode = NO;
        [self.photoButton setEnabled:YES];
    } else {
        [self.btn setTitle:@"Done" forState:UIControlStateNormal];
        isEditMode = YES;
        [self.photoButton setEnabled:NO];
    }
    [self.view reloadData];
}

-(void)pickupPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;   
    [self presentModalViewController:picker animated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) picker {
    [self dismissModalViewControllerAnimated:YES];
    [picker release];
}

- (void)imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self.images addObject:[info objectForKey:UIImagePickerControllerOriginalImage]];
    [self.view reloadData];
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [picker release];
}

-(void) removeSelectedImage:(UIImage *)image {
    [self.images removeObject:image];
    [self.view reloadData];
}

@end
