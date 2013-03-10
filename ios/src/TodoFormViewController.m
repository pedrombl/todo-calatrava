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
    if (jsViewObject[@"new_task"] != nil) {
        NSString *taskValue = [jsViewObject[@"new_task"][@"content"] copy];
        NSString *taskId = [jsViewObject[@"new_task"][@"id"] description];
        [tasks setValue: taskValue forKey:taskId];
    }
    else {
        if (jsViewObject[@"disable_task"][@"id"] != nil) {
            NSString *taskContent = tasks[[jsViewObject[@"disable_task"][@"id"] description]];
            [tasks removeObjectForKey:[jsViewObject[@"disable_task"][@"id"] description]];
            [tasks_done setValue:taskContent forKey:[jsViewObject[@"disable_task"][@"id"] description]];
        }
        else {
            NSString *taskContent = tasks_done[[jsViewObject[@"enable_task"][@"id"] description]];
            [tasks_done removeObjectForKey:[jsViewObject[@"enable_task"][@"id"] description]];
            [tasks setValue:taskContent forKey:[jsViewObject[@"enable_task"][@"id"] description]];
        }
        
    }
    [tasksTable reloadData];
}

- (id)valueForField:(NSString *)field {
    if ([field isEqualToString:@"task_input"]) {
        return self.taskInput.text;
    }
    else {
        NSString *taskId = [field substringFromIndex:14];
        if (tasks[taskId] != nil) {
            return @"true";
        }
        else {
            return @"false";
        }
    }
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
    NSString *taskContent = [cell.textLabel.text copy];
    NSMutableDictionary *tasksDictionary = [self getDictionaryForSection:indexPath.section];
    NSString *taskId = [tasksDictionary allKeysForObject:taskContent][0];
    [self dispatchEvent:[NSString stringWithFormat:@"task_checkbox_%@", taskId] withArgs:@[]];
    //[tasksTable reloadData];
}

- (NSArray *)getArrayForSection:(NSInteger)section {
    return [[self getDictionaryForSection:section] allValues];
}

- (NSMutableDictionary *)getDictionaryForSection:(NSInteger)section {
    if(section == 0)
        return tasks;
    else
        return tasks_done;
}



@end










