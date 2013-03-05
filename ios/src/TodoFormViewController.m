//
//  TodoFormViewController.m
//  todo_mobile
//
//  Created by Pedro Leal on 3/3/13.
//
//

#import "TodoFormViewController.h"

@interface TodoFormViewController ()

@end

@implementation TodoFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
}

- (id)valueForField:(NSString *)field {
    return self.taskInput.text;
}

@end
