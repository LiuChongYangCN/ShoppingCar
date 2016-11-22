//
//  CYRootCell.m
//  ShoppingCar
//
//  Created by 刘崇阳 on 2016/11/21.
//  Copyright © 2016年 WKBP. All rights reserved.
//

#import "CYRootCell.h"
@interface CYRootCell()
@property (weak, nonatomic)   IBOutlet UIButton *subShopCountBtn;
@property (weak, nonatomic)   IBOutlet UILabel *priceLabel;
@property (weak, nonatomic)   IBOutlet UILabel *shopCountLabel;
@property (weak, nonatomic)   IBOutlet UIButton *selectShopBtn;
@property (assign, nonatomic) BOOL isCountOne;
@property (weak, nonatomic) id <CYRootCellDelate> delegate;
@end
@implementation CYRootCell
- (void)awakeFromNib {
	[super awakeFromNib];
	self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (void)setIsSelectShop:(BOOL)isSelectShop {
	
	if (isSelectShop) {
		[self.selectShopBtn setBackgroundImage:[UIImage imageNamed:@"select"] forState:(UIControlStateSelected)];
	} else {
		[self.selectShopBtn setBackgroundImage:[UIImage imageNamed:@"unSelect"] forState:(UIControlStateNormal)];
	}
}

- (void)setIsCountOne:(BOOL)isCountOne {
	
	if (isCountOne) {
		[_subShopCountBtn setBackgroundColor:[UIColor orangeColor]];
		_subShopCountBtn.enabled = YES;
	} else {
		[_subShopCountBtn setBackgroundColor:[UIColor grayColor]];
		_subShopCountBtn.enabled = NO;
	}
}
+ (instancetype)rootCellWithTableView:(UITableView *)tableView
							 delegate:(id)delegate
							indexPath:(NSIndexPath *)indexPath {
	//	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	CYRootCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([CYRootCell class]) owner:nil options:nil] lastObject];
	cell.delegate = delegate;
	cell.indexPath = indexPath;
	return cell;
}
- (void)setDict:(NSDictionary *)dict {
	
	self.priceLabel.text = ((NSNumber *)[dict objectForKey:@"price"]).stringValue;
	NSInteger shopCount = ((NSNumber *)[dict objectForKey:@"count"]).integerValue;
	self.shopCountLabel.text = @(shopCount).stringValue;
	if (shopCount == 1) {
		self.isCountOne = NO;
	}
//	self.isSelectShop = ((NSNumber *)[dict objectForKey:@"select"]).boolValue;
	self.isSelectShop = 1;
	NSLog(@"%d",self.isSelectShop);
}
- (IBAction)select:(UIButton *)sender {
	
//	sender.selected = !sender.selected;
//	self.isSelectShop = sender.selected;
//	if ([self.delegate respondsToSelector:@selector(selectShopButtonClickWithCell:)]) {
//		[self.delegate selectShopButtonClickWithCell:self];
//	}
}
- (IBAction)addShopCount:(UIButton *)sender {
	self.isCountOne = YES;
	if ([self.delegate respondsToSelector:@selector(addButtonClickWithCell:)]) {
		[self.delegate addButtonClickWithCell:self];
	}
}
- (IBAction)subShopCount:(UIButton *)sender {

	if ([self.delegate respondsToSelector:@selector(subButtonClickWithCell:)]) {
		[self.delegate subButtonClickWithCell:self];
	}
}
@end
