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
    NSMutableDictionary *tasks_done;
}

@end

@implementation TodoFormViewController

@synthesize tasksTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        tasks = [[NSMutableDictionary alloc] init];
        tasks_done = [[NSMutableDictionary alloc] init];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    return [[self getArrayForSection:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"ToDo";
    }
    else {
        return @"Done";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath %d", indexPath.row);
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    NSLog(@" end cellForRowAtIndexPath %d", indexPath.row);
    
    NSArray *tasksValue = [self getArrayForSection:indexPath.section];
    cell.textLabel.text = tasksValue[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath");
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *task_content = [cell.textLabel.text copy];
    NSString *task_id = [tasks allKeysForObject:task_content][0];
    [tasks removeObjectForKey:task_id];
    [tasksTable reloadData];
}

- (NSArray *)getArrayForSection:(NSInteger)section {
    if(section == 0)
        return [tasks allValues];
    else
        return [tasks_done allValues];
}



@end










