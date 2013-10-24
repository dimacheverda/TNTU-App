//
//  ArticleViewController.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()
{
    NSTextStorage *textStorage;
    NSLayoutManager *layoutManager;
    NSTextContainer *textContainer;
}

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ArticleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    textStorage = [[NSTextStorage alloc] initWithString:@"Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем."];
    layoutManager = [[NSLayoutManager alloc] init];
    textContainer = [[NSTextContainer alloc] init];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, self.view.bounds.size.height - 115.0) textContainer:textContainer];
    NSLog(@"%f", self.tabBarController.tabBar.bounds.origin.y);
    [self.textView setScrollEnabled:YES];
    [self.view addSubview:self.textView];
    
}


@end
