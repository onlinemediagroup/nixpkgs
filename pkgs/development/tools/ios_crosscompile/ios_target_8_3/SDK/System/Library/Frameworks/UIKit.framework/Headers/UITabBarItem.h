//
//  UITabBarItem.h
//  UIKit
//
//  Copyright (c) 2008-2014 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIBarItem.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UITabBarSystemItem) {
    UITabBarSystemItemMore,
    UITabBarSystemItemFavorites,
    UITabBarSystemItemFeatured,
    UITabBarSystemItemTopRated,
    UITabBarSystemItemRecents,
    UITabBarSystemItemContacts,
    UITabBarSystemItemHistory,
    UITabBarSystemItemBookmarks,
    UITabBarSystemItemSearch,
    UITabBarSystemItemDownloads,
    UITabBarSystemItemMostRecent,
    UITabBarSystemItemMostViewed,
};

@class UIView, UIImage;

NS_CLASS_AVAILABLE_IOS(2_0) @interface UITabBarItem : UIBarItem {
@private
    NSString     *_title;
    SEL           _action;
    id            _target;
    UIImage      *_templateImage;
    UIImage      *_selectedTemplateImage;
    UIImage      *_selectedImage;
    UIImage      *_unselectedImage;
    UIEdgeInsets  _imageInsets;
    NSString     *_badgeValue;
    UIView       *_view;
    NSInteger     _tag;
    id            _appearanceStorage;
    struct {
	unsigned int enabled:1;
	unsigned int style:3;
	unsigned int isSystemItem:1;
	unsigned int systemItem:7;
	unsigned int viewIsCustom:1;
	unsigned int animatedBadge:1;
	unsigned int customSelectedImage:1;
	unsigned int customUnselectedImage:1;
    } _tabBarItemFlags;
}

/* The unselected image is autogenerated from the image argument. The selected image
 is autogenerated from the selectedImage if provided and the image argument otherwise.
 To prevent system coloring, provide images with UIImageRenderingModeAlwaysOriginal (see UIImage.h)
 */
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag;
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage NS_AVAILABLE_IOS(7_0);
- (instancetype)initWithTabBarSystemItem:(UITabBarSystemItem)systemItem tag:(NSInteger)tag;

@property(nonatomic,retain) UIImage *selectedImage NS_AVAILABLE_IOS(7_0);

@property(nonatomic,copy) NSString *badgeValue;    // default is nil

/*  These methods are now deprecated. Please use -initWithTitle:image:selectedImage:.
 */
- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage NS_DEPRECATED_IOS(5_0,7_0,"Use initWithTitle:image:selectedImage: or the image and selectedImage properties along with UIImageRenderingModeAlwaysOriginal");
- (UIImage *)finishedSelectedImage NS_DEPRECATED_IOS(5_0,7_0);
- (UIImage *)finishedUnselectedImage NS_DEPRECATED_IOS(5_0,7_0);

/* To set item label text attributes use the appearance selectors available on the superclass, UIBarItem.

   Use the following to tweak the relative position of the label within the tab button (for handling visual centering corrections if needed because of custom text attributes)
 */
- (void)setTitlePositionAdjustment:(UIOffset)adjustment NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR; 
- (UIOffset)titlePositionAdjustment NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

@end
