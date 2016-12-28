//
//  RandomUserDetailViewController.m
//  RandomGuys
//
//  Created by David Miotti on 27/12/2016.
//  Copyright © 2016 David Miotti. All rights reserved.
//

#import "RandomUserDetailVC.h"

@interface RandomUserDetailVC ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSInteger RandomUserDetailNumberOfFields = 10;
typedef NS_ENUM(NSInteger, RandomUserDetailField) {
    RandomUserDetailFieldTitle,
    RandomUserDetailFieldFirstname,
    RandomUserDetailFieldLastname,
    RandomUserDetailFieldEmail,
    RandomUserDetailFieldPhone,
    RandomUserDetailFieldStreet,
    RandomUserDetailFieldCity,
    RandomUserDetailFieldState,
    RandomUserDetailFieldPostcode,
    RandomUserDetailFieldPicture
};

@implementation RandomUserDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = [[@[self.randomUser.firstname, self.randomUser.lastname] componentsJoinedByString:@" "] capitalizedString];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return RandomUserDetailNumberOfFields;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RandomUserDetailCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case RandomUserDetailFieldTitle:
            cell.textLabel.text = NSLocalizedString(@"Title", @"");
            cell.detailTextLabel.text = self.randomUser.title;
            break;
            
        case RandomUserDetailFieldFirstname:
            cell.textLabel.text = NSLocalizedString(@"Firstname", @"");
            cell.detailTextLabel.text = self.randomUser.firstname;
            break;
            
        case RandomUserDetailFieldLastname:
            cell.textLabel.text = NSLocalizedString(@"Lastname", @"");
            cell.detailTextLabel.text = self.randomUser.lastname;
            break;
            
        case RandomUserDetailFieldEmail:
            cell.textLabel.text = NSLocalizedString(@"Email", @"");
            cell.detailTextLabel.text = self.randomUser.email;
            break;
            
        case RandomUserDetailFieldPhone:
            cell.textLabel.text = NSLocalizedString(@"Phone", @"");
            cell.detailTextLabel.text = self.randomUser.phone;
            break;
            
        case RandomUserDetailFieldStreet:
            cell.textLabel.text = NSLocalizedString(@"Street", @"");
            cell.detailTextLabel.text = self.randomUser.street;
            break;
            
        case RandomUserDetailFieldCity:
            cell.textLabel.text = NSLocalizedString(@"City", @"");
            cell.detailTextLabel.text = self.randomUser.city;
            break;
            
        case RandomUserDetailFieldState:
            cell.textLabel.text = NSLocalizedString(@"State", @"");
            cell.detailTextLabel.text = self.randomUser.state;
            break;
            
        case RandomUserDetailFieldPostcode:
            cell.textLabel.text = NSLocalizedString(@"Postcode", @"");
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", self.randomUser.postcode];
            break;
            
        case RandomUserDetailFieldPicture:
            cell.textLabel.text = NSLocalizedString(@"Picture", @"");
            cell.detailTextLabel.text = self.randomUser.picture;
            break;
            
        default:
            break;
    }
}

@end
