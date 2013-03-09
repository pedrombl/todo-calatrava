//
//  TodoFormViewController.m
//  todo_mobile
//
//  Created by Pedro Leal on 3/3/13.
//
//

#import "TodoFormViewController.h"

@interface TodoFormViewController () {
    NSMutableDictionary *tasks;
}

@end

@implementation TodoFormViewController

@synthesize tasksTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        tasks = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideKeyboard {
    [_taskInput resignFirstResponder];
}

- (IBAction)addTask {
    [self hideKeyboard];
    [self dispatchEvent:@"add_task" withArgs:@[]];
}

- (void)render:(NSDictionary *)jsViewObject {
    [tasks setValue:jsViewObject[@"new_task"][@"content"] forKey:jsViewObject[@"new_task"][@"id"]];
    [tasksTable reloadData];
}

- (id)valueForField:(NSString *)field {
    return self.taskInput.text;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath %d", indexPath.row);
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    NSLog(@" end cellForRowAtIndexPath %d", indexPath.row);
    
    NSArray *tasksValue = [tasks allValues];
    cell.textLabel.text = tasksValue[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath");
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tasks removeObjectForKey:[tasks allKeysForObject:cell.textLabel.text][0]];
    [tasksTable reloadData];
}



@end










