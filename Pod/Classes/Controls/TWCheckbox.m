//
//  TWCombobox.m
//  WeiLib
//
//  Created by Tianwei on 4/8/13.
//  Copyright (c) 2013 Tianwei. All rights reserved.
//

#import "TWCheckbox.h"

@implementation TWCheckbox
@synthesize selected;
@synthesize icon;
@synthesize label;
@synthesize offImage;
@synthesize onImage;
@synthesize labelString;
@synthesize coverButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setOpaque:NO];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andLabel:(NSString *)s andImagePath:(NSString *)p1 andSelectedImagePath:(NSString *)p2 andInitValue:(BOOL)b andFont:(UIFont *)f andLabelColor:(UIColor *)color andIconLabelDistance:(CGFloat)d andIconLeft:(CGFloat)xpos{
    self = [super initWithFrame:frame];
    if (self) {
        [self setOpaque:NO];
        
        selected = b;
        offImage = [UIImage imageNamed:p1];
        onImage = [UIImage imageNamed:p2];
        labelString = s;
        
        CGRect iconRect = CGRectZero;
        iconRect.origin.x = xpos;
        iconRect.size = CGSizeMake(f.pointSize, f.pointSize);
        iconRect.origin.y = roundf(0.5f*(frame.size.height - iconRect.size.height));
        icon = [[UIImageView alloc] initWithFrame:iconRect];
        icon.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:icon];
        
        CGRect labelRect = CGRectMake(iconRect.origin.x + iconRect.size.width + d,
                                      0,
                                      frame.size.width - (iconRect.origin.x + iconRect.size.width + d),
                                      frame.size.height);
        label = [[UILabel alloc] initWithFrame:labelRect];
        label.backgroundColor = [UIColor clearColor];
        label.font = f;
        label.textColor = color;
        label.text = labelString;
        [self addSubview:label];
        
        coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        coverButton.frame = self.bounds;
        [coverButton addTarget:self action:@selector(coverClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:coverButton];
        
        [self refreshIcon];
    }
    return self;
}

-(void)coverClicked{
    selected = !selected;
    [self refreshIcon];
    if ([self.delegate respondsToSelector:@selector(checkbox:valueDidChange:)]) {
        [self.delegate checkbox:self valueDidChange:selected];
    }
}

-(void)refreshIcon{
    icon.image = selected?onImage:offImage;
}

-(BOOL)selected{
    return selected;
}

-(void)setSelected:(BOOL)__selected{
    selected = __selected;
    [self refreshIcon];
}

-(void)sizeToFit{
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           label.font, NSFontAttributeName, nil];
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:labelString
                                           attributes:attrs];
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    CGRect r = label.frame;
    r.size.width = rect.size.width;
    label.frame = r;
    
    CGRect r1 = self.frame;
    r1.size.width = r.origin.x + r.size.width;
    self.frame = r1;
}

+(TWCheckbox *)checkboxWithFrame:(CGRect)r andLabel:(NSString *)s andImagePath:(NSString *)p1 andSelectedImagePath:(NSString *)p2 andInitValue:(BOOL)b andFont:(UIFont *)f andLabelColor:(UIColor *)color andIconLabelDistance:(CGFloat)d andIconLeft:(CGFloat)xpos{
    TWCheckbox *cb = [[TWCheckbox alloc] initWithFrame:r andLabel:s andImagePath:p1 andSelectedImagePath:p2 andInitValue:b andFont:f andLabelColor:color andIconLabelDistance:d andIconLeft:xpos];
    return cb;
}

- (void)setDelegate:(id)val
{
    _delegate = val;
}

- (id)delegate
{
    return _delegate;
}

@end
