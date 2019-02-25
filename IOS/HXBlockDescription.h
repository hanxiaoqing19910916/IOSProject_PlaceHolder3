//
//  HXBlockDescription.h

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(int, BlockFlags) {
    BlockFlagsHasCopyDisposeHelpers = (1 << 25),
    BlockFlagsHasSignature          = (1 << 30)
};

enum {
    BLOCK_REFCOUNT_MASK =     (0xffff),
    BLOCK_NEEDS_FREE =        (1 << 24),
    BLOCK_HAS_COPY_DISPOSE =  (1 << 25),
    BLOCK_HAS_CTOR =          (1 << 26), /* Helpers have C++ code. */
    BLOCK_IS_GC =             (1 << 27),
    BLOCK_IS_GLOBAL =         (1 << 28),
    BLOCK_HAS_DESCRIPTOR =    (1 << 29)
};

struct Block_literal_1 {
    void *isa; // initialized to &_NSConcreteStackBlock or &_NSConcreteGlobalBlock
    BlockFlags flags;
    int reserved;
    void (*invoke)(void *, ...);
    struct Block_descriptor_1 {
        unsigned long int reserved;         // NULL
        unsigned long int size;         // sizeof(struct Block_literal_1)
        // optional helper functions
        void (*copy_helper)(void *dst, void *src);     // IFF (1<<25)
        void (*dispose_helper)(void *src);             // IFF (1<<25)
        // required ABI.2010.3.16
        const char *signature;                         // IFF (1<<30)
    } *descriptor;
    // imported variables
};

@interface HXBlockDescription : NSObject

// 传入block对象，打印出原有的block结构（参数，返回值）
+ (NSString *)descriptionOfBlock:(id)block;

//+ (NSUInteger)blockInvokeFunctionPtr;

@end




















