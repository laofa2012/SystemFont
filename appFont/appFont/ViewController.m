//
//  ViewController.m
//  appFont
//
//  Created by Yuanhai on 15/3/19.
//  Copyright © 2019年 Yuanhai. All rights reserved.
//

#import "ViewController.h"
#import "CTFontViewController.h"

@interface ViewController () <UITableViewDelegate ,UITableViewDataSource>

//
@property (nonatomic, strong) NSArray *fontLists;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 70.0f;
    tableView.sectionHeaderHeight = 40.0f;
    [self.view addSubview:tableView];
    
    for (NSString *fontFamilyName in [UIFont familyNames])
    {
        NSLog(@"familyNames:%@" , fontFamilyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName])
        {
            NSLog(@"fontName:%@", fontName);
        }
        NSLog(@"------------------------------------");
    }
}

#pragma mark - Getter

- (NSArray *)fontLists
{
    if (!_fontLists) {
        _fontLists = [UIFont familyNames];
    }
    return  _fontLists;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fontLists.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *fontFamily = self.fontLists[section];
    return [UIFont fontNamesForFamilyName:fontFamily].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *fontFamily = self.fontLists[indexPath.section];
    NSArray *fonts = [UIFont fontNamesForFamilyName:fontFamily];
    
    cell.textLabel.text = @"abc&123?ABC?字体!";
    cell.textLabel.font = [UIFont fontWithName:fonts[indexPath.row] size:17];
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.detailTextLabel.text = fonts[indexPath.row];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *fontFamily = self.fontLists[section];
    return fontFamily;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CTFontViewController *fontVc = [[CTFontViewController alloc] init];
    NSString *fontFamily = self.fontLists[indexPath.section];
    NSArray *fonts = [UIFont fontNamesForFamilyName:fontFamily];
    fontVc.fontStr = fonts[indexPath.row];
    [self.navigationController pushViewController:fontVc animated:YES];
}

@end
