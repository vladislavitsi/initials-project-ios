//
//  TableViewCell.m
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 5/7/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *preview;
@property (weak, nonatomic) IBOutlet UILabel *descr;


@property (nonatomic, copy) NSMutableArray *constraints;
@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [NSLayoutConstraint activateConstraints:@[]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initializeCellWithDescr:(NSString *)descr pattern:(Pattern *)pattern letters:(NSArray<NSString *> *)letters{
    self.descr.text = descr;
    self.constraints = [NSMutableArray array];
    CGFloat width = self.preview.frame.size.width;
    CGFloat segment = width/26.0;
//    CGFloat halfSegment = segment / 2.0;

    __weak TableViewCell *weakSelf = self;
    [letters enumerateObjectsUsingBlock:^(NSString *letter, NSUInteger idx, BOOL *stop) {
        UILabel *letterLabel = [[UILabel alloc] init];
        letterLabel.text = letter;
        letterLabel.font = [UIFont systemFontOfSize:pattern.size];
        
        [weakSelf.preview addSubview:letterLabel];
        
        [weakSelf.constraints addObject:[letterLabel.centerXAnchor constraintEqualToAnchor:weakSelf.preview.leadingAnchor constant:(segment * (pattern.letterPatterns[idx].x + 11))]];
        [weakSelf.constraints addObject:[letterLabel.centerYAnchor constraintEqualToAnchor:weakSelf.preview.topAnchor constant:(segment * (pattern.letterPatterns[idx].y + 11))]];
    }];
    [NSLayoutConstraint activateConstraints:self.constraints];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [NSLayoutConstraint deactivateConstraints:self.constraints];
}

@end
