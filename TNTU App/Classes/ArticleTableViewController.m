//
//  ArticleTableViewController.m
//  TNTU App
//
//  Created by Dima on 11/2/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ArticleTableViewController.h"
#import "ArticleTextView.h"

@interface ArticleTableViewController ()
{
    NSString *content;
}

@property (strong, nonatomic) ArticleTextView *textView;
@property (strong, nonatomic) UIView *footerView;

@end

@implementation ArticleTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    content = @"      Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. \r\n\r\n      Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.\r\n\r\n      Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. \r\n      Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. \r\n      Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.";
    
    self.footerView = [[UIView alloc] init];
    self.textView = [[ArticleTextView alloc] initWithFrame:CGRectZero content:content];
    [self.footerView addSubview:self.textView];
    [self.tableView addSubview:self.footerView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    UIImageView *imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    [self.textView addImageViews:@[imageView1, imageView2, imageView3, imageView4]];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.textView.frame = CGRectMake(0.0,
                                     0.0,
                                     320.0,
                                     self.textView.contentSize.height);
    self.footerView.frame = CGRectMake(0.0,
                                       0.0,
                                       320.0,
                                       self.textView.contentSize.height);
    self.tableView.contentSize = CGSizeMake(320.0,
                                            self.textView.contentSize.height);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark

@end
