//
//  TodoFormViewController.h
//  todo_mobile
//
//  Created by Pedro Leal on 3/3/13.
//
//

#import "BaseUIViewController.h"

@interface TodoFormViewController : BaseUIViewController<UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tasksTable;
}

@property (retain, nonatomic) IBOutlet UITextField *taskInput;
@property (retain, nonatomic) UITableView *tasksTable;


- (void)render:(NSDictionary *)jsViewObject;
- (id)valueForField:(NSString *)field;
- (IBAction)addTask;

@end
