//
//  ArticleViewController.m
//  TNTU App
//
//  Created by Dima on 9/16/13.
//  Copyright (c) 2013 Dima. All rights reserved.
//

#import "ArticleViewController.h"
#import "TntuDesignKit.h"

@interface ArticleViewController ()
{
    NSTextStorage *textStorage;
    NSLayoutManager *layoutManager;
    NSTextContainer *textContainer;
    
    UIScrollView *scrollView;
}

@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation ArticleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *content = @"Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.Кафедра програмної інженерії є структурним навчально-науковим підрозділом університету і входить до складу факультету комп’ютерно-інформаційних систем та програмної інженерії. Кафедра є випусковою та забезпечує освітню підготовку фахівців за напрямом 6.050103 - Програмна інженерія та 7.05010302, 8.05010302 - Інженерія програмного забезпечення. Випускники кафедри отримують кваліфікацію: бакалавр – фахівець з розробки та тестування ПЗ, маґістр – професіонал в галузі проектування та інженерії програмних систем.";
    
    // Text view init
    textStorage = [[NSTextStorage alloc] initWithString:content];
    layoutManager = [[NSLayoutManager alloc] init];
    textContainer = [[NSTextContainer alloc] init];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0,
                                                                 0.0f,
                                                                 self.view.frame.size.width,
                                                                 self.view.frame.size.height - 115.0f)
                                        textContainer:textContainer];
    self.textView.font = [TntuDesignKit fontForArticleContent];
    [self.textView setTextContainerInset:UIEdgeInsetsMake(8.0, 2.0, 8.0, 2.0)];
    [self.textView setTextAlignment:NSTextAlignmentLeft];
    [self.textView setSelectable:NO];
    [self.textView setEditable:NO];
    [self.textView setScrollEnabled:YES];
    [self.textView setTextColor:[UIColor colorWithRed:38.0/255.0 green:38.0/255.0 blue:38.0/255.0 alpha:1.0]];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    UIImageView *imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    [TntuDesignKit addImageViews:@[imageView1, imageView2, imageView3, imageView4] toTextView:self.textView];
    
    [self.view addSubview:self.textView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
//    NSLog(@"layout     %@", self.textView.textContainer.exclusionPaths);
    
}

@end
