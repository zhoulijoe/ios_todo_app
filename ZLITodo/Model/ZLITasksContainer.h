#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

@interface ZLITasksContainer : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSArray *tasks;

@end