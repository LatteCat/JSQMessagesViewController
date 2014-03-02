//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSMessagesViewController
//
//
//  The MIT License
//  Copyright (c) 2014 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "JSQMessagesCollectionViewCell.h"

const CGFloat kJSQMessagesCollectionViewCellLabelHeightDefault = 20.0f;


@interface JSQMessagesCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *cellTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageBubbleTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellBottomLabel;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIView *bubbleContainerView;
@property (weak, nonatomic) IBOutlet UIView *avatarContainerView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellTopLabelHeightContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bubbleTopLabelHeightContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellBottomLabelHeightContraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarContainerViewWidthContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarContainerViewHeightContraint;

@end



@implementation JSQMessagesCollectionViewCell

@synthesize font = _font;

#pragma mark - Class methods

+ (UINib *)nib
{
    return nil;
}

+ (NSString *)cellReuseIdentifier
{
    return nil;
}

#pragma mark - Initialization

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.cellTopLabel.textAlignment = NSTextAlignmentCenter;
    self.cellTopLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    self.cellTopLabel.textColor = [UIColor lightGrayColor];
    
    self.messageBubbleTopLabel.font = [UIFont systemFontOfSize:12.0f];
    self.messageBubbleTopLabel.textColor = [UIColor lightGrayColor];
    
    self.cellBottomLabel.font = [UIFont systemFontOfSize:12.0f];
    self.cellBottomLabel.textColor = [UIColor lightGrayColor];
    
    self.textView.textColor = [UIColor blackColor];
    self.textView.editable = NO;
    self.textView.userInteractionEnabled = YES;
    self.textView.showsHorizontalScrollIndicator = NO;
    self.textView.showsVerticalScrollIndicator = NO;
    self.textView.scrollEnabled = NO;
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.contentInset = UIEdgeInsetsZero;
    self.textView.scrollIndicatorInsets = UIEdgeInsetsZero;
    self.textView.textContainerInset = UIEdgeInsetsMake(8.0f, 4.0f, 2.0f, 4.0f);
    self.textView.contentOffset = CGPointZero;
}

#pragma mark - Setters

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    
    self.cellTopLabel.backgroundColor = backgroundColor;
    self.messageBubbleTopLabel.backgroundColor = backgroundColor;
    self.cellBottomLabel.backgroundColor = backgroundColor;
    
    self.bubbleImageView.backgroundColor = backgroundColor;
    self.avatarImageView.backgroundColor = backgroundColor;
    
    self.bubbleContainerView.backgroundColor = backgroundColor;
    self.avatarContainerView.backgroundColor = backgroundColor;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    _textView.font = font;
    [self setNeedsLayout];
}

- (void)setBubbleImageView:(UIImageView *)bubbleImageView
{
    // TODO:
    _bubbleImageView = bubbleImageView;
}

- (void)setAvatarImageView:(UIImageView *)avatarImageView
{
    // TOOD:
    _avatarImageView = avatarImageView;
}

- (void)setCellTopLabelHeight:(CGFloat)cellTopLabelHeight
{
    self.cellTopLabelHeightContraint.constant = cellTopLabelHeight;
    [self setNeedsUpdateConstraints];
}

- (void)setBubbleTopLabelHeight:(CGFloat)bubbleTopLabelHeight
{
    self.bubbleTopLabelHeightContraint.constant = bubbleTopLabelHeight;
    [self setNeedsUpdateConstraints];
}

- (void)setCellBottomLabelHeight:(CGFloat)cellBottomLabelHeight
{
    self.cellBottomLabelHeightContraint.constant = cellBottomLabelHeight;
    [self setNeedsUpdateConstraints];
}

- (void)setAvatarViewSize:(CGSize)avatarViewSize
{
    self.avatarContainerViewWidthContraint.constant = avatarViewSize.width;
    self.avatarContainerViewHeightContraint.constant = avatarViewSize.height;
    [self setNeedsUpdateConstraints];
}

#pragma mark - Getters

- (UIFont *)font
{
    if (!_font) {
        _font = [[[self class] appearance] font];
    }
    
    return _font;
}

- (CGFloat)cellTopLabelHeight
{
    return self.cellTopLabelHeightContraint.constant;
}

- (CGFloat)bubbleTopLabelHeight
{
    return self.bubbleTopLabelHeightContraint.constant;
}

- (CGFloat)cellBottomLabelHeight
{
    return self.cellBottomLabelHeightContraint.constant;
}

- (CGSize)avatarViewSize
{
    return CGSizeMake(self.avatarContainerViewWidthContraint.constant,
                      self.avatarContainerViewHeightContraint.constant);
}

@end
