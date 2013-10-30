//
//  NewsSecondaryTableViewController.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "InfoSecondaryTableViewController.h"
#import "ArticleTextView.h"

@interface InfoSecondaryTableViewController ()
{
    NSString *selectedTitle;
    CGFloat basicContentHeight;
    NSString *content;
    CGPoint footerOrigin;
}

@property (strong, nonatomic) ArticleTextView *textView;
@property (strong, nonatomic) UIView *footerView;

@end

@implementation InfoSecondaryTableViewController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     content = @"Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.";
    
    self.footerView = [[UIView alloc] init];
    self.textView = [[ArticleTextView alloc] initWithFrame:CGRectZero content:content];
    [self.footerView addSubview:self.textView];
    [self.tableView addSubview:self.footerView];
    basicContentHeight = self.tableView.contentSize.height;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    basicContentHeight = [self.tableView numberOfRowsInSection:0] * 44.0 + 44.0;
    
    self.textView.frame = CGRectMake(0.0,
                                     0.0,
                                     320.0,
                                     self.textView.contentSize.height);
    self.footerView.frame = CGRectMake(0.0,
                                       basicContentHeight,
                                       320.0,
                                       self.textView.contentSize.height);
    self.tableView.contentSize = CGSizeMake(320.0,
                                            self.textView.contentSize.height + basicContentHeight);
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    cell.textLabel.text = [self.contentArray objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    selectedTitle = [self.contentArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"Show Article" sender:self];
}

#pragma mark

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Show Article"]) {
        [[segue.destinationViewController navigationItem] setTitle:selectedTitle];
    }
}

@end