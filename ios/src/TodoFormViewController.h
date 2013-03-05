//
//  TodoFormViewController.h
//  todo_mobile
//
//  Created by Pedro Leal on 3/3/13.
//
//

#import "BaseUIViewController.h"

@interface TodoFormViewController : BaseUIViewController

@property (retain, nonatomic) IBOutlet UITextField *taskInput;


- (void)render:(NSDictionary *)jsViewObject;
- (id)valueForField:(NSString *)field;
- (IBAction)addTask;

@end
