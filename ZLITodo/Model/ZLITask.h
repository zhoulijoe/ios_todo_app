#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

@interface ZLITask : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *desc;
@property (assign, nonatomic) BOOL complete;

- (instancetype)initWithID:(NSString *)ID desc:(NSString *)desc complete:(BOOL)complete;

@end
