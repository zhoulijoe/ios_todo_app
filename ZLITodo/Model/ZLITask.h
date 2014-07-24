#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

@interface ZLITask : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *description;
@property (assign, nonatomic) BOOL complete;

- (instancetype)initWithID:(NSString *)ID description:(NSString *)description complete:(BOOL)complete;

@end
