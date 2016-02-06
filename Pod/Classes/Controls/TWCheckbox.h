//
//  TWCombobox.h
//  WeiLib
//
//  Created by Tianwei on 4/8/13.
//  Copyright (c) 2013 Tianwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckboxDelegate;
@interface TWCheckbox : UIView{
    id <CheckboxDelegate> _delegate;
}

@property BOOL selected;

@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UIImage *onImage;
@property (nonatomic,strong) UIImage *offImage;

@property (nonatomic,strong) NSString *labelString;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *coverButton;

-(BOOL)selected;
-(void)setSelected:(BOOL)selected;
- (void)setDelegate:(id)val;
- (id)delegate;
-(id)initWithFrame:(CGRect)frame andLabel:(NSString *)s andImagePath:(NSString *)p1 andSelectedImagePath:(NSString *)p2 andInitValue:(BOOL)b andFont:(UIFont *)f andLabelColor:(UIColor *)color andIconLabelDistance:(CGFloat)d andIconLeft:(CGFloat)xpos;
+(TWCheckbox *)checkboxWithFrame:(CGRect)r andLabel:(NSString *)s andImagePath:(NSString *)p1 andSelectedImagePath:(NSString *)p2 andInitValue:(BOOL)b andFont:(UIFont *)f andLabelColor:(UIColor *)color andIconLabelDistance:(CGFloat)d andIconLeft:(CGFloat)xpos;
@end

@protocol CheckboxDelegate <NSObject>
@optional
-(void)checkbox:(TWCheckbox *)combo valueDidChange:(BOOL)v;
@end
