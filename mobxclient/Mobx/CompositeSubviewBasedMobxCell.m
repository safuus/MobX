//
//  CompositeSubviewBasedMobxCell.m
//  Mobx
//
//  Created by Weicheng Peng on 7/21/11.
//  Copyright 2011 Mobx. All rights reserved.
//

#import "CompositeSubviewBasedMobxCell.h"

@interface CompositeSubviewBasedMobxCellContentView : UIView
{
    MobxCell *_cell;
    BOOL _highlighted;
}

@end

@implementation CompositeSubviewBasedMobxCellContentView

- (id)initWithFrame:(CGRect)frame cell:(MobxCell *)cell
{
    if (self = [super initWithFrame:frame])
    {
        _cell = cell;
        
        self.opaque = YES;
        self.backgroundColor = _cell.backgroundColor;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [_cell.icon drawAtPoint:CGPointMake(11.0, 5.0)];

    _highlighted ? [[UIColor whiteColor] set] : [[UIColor blackColor] set];
    [_cell.name drawAtPoint:CGPointMake(81.0, 22.0) withFont:[UIFont boldSystemFontOfSize:17.0]];                
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    [self setNeedsDisplay];
}

- (BOOL)isHighlighted
{
    return _highlighted;
}

@end

#pragma mark -

@implementation CompositeSubviewBasedMobxCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        cellContentView = [[CompositeSubviewBasedMobxCellContentView alloc] initWithFrame:CGRectInset(self.contentView.bounds, 0.0, 1.0) cell:self];
        cellContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        cellContentView.contentMode = UIViewContentModeRedraw;
        [self.contentView addSubview:cellContentView];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    [UIView setAnimationsEnabled:NO];
    CGSize contentSize = cellContentView.bounds.size;
    cellContentView.contentStretch = CGRectMake(225.0 / contentSize.width, 0.0, (contentSize.width - 260.0) / contentSize.width, 1.0);
    [UIView setAnimationsEnabled:YES];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    cellContentView.backgroundColor = backgroundColor;
}

- (void)dealloc
{
    [cellContentView release];
    
    [super dealloc];
}

@end
