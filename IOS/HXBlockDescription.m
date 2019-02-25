//
//  HXBlockDescription.m

#import "HXBlockDescription.h"

@implementation HXBlockDescription

static __attribute__((always_inline))  NSString *ocTypeFromSignatureCType(const char *ctype)
{
    static NSDictionary *typeDict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        typeDict = @{@"i": @"int", @"s": @"short",
                     @"f": @"float",@"d": @"double",
                     @"l": @"long", @"q": @"long long",
                     @"c": @"char",  @"B": @"BOOL",
                     @"*": @"pointer(*)", @"^{objc_ivar=}": @"Ivar",
                     @"^{objc_method=}": @"Method", @"@?": @"Block",
                     @"#": @"Class", @":": @"SEL", @"@": @"id"};
    });
    
    NSString *type = [NSString stringWithUTF8String:ctype];
    if ([typeDict.allKeys containsObject:type]) {
        return typeDict[type];
    } else if ([type rangeOfString:@"@\""].location != NSNotFound) {
        NSString *className = [type substringWithRange:NSMakeRange(2, type.length - 3)];
        return [NSString stringWithFormat:@"%@ *",className];
    } else {
        return nil;
    }
}

static NSMethodSignature *methodSignatureFromBlock(id block)
{
    struct Block_literal_1 *blcokl = (__bridge struct Block_literal_1 *) block;
    if (!(blcokl->flags & BlockFlagsHasSignature)) {
        return nil;
    }
    void *blockDesc = blcokl->descriptor;
    blockDesc += 2 * sizeof(unsigned long int);
    
    if (blcokl->flags & BlockFlagsHasCopyDisposeHelpers) {
        blockDesc += 2 * sizeof(void (*) (void *dst, void *src));
    }
    
    if (blockDesc == NULL) {
        return nil;
    }
    const char *signature = *(void **)blockDesc;
    return [NSMethodSignature signatureWithObjCTypes:signature];
}


+ (NSString *)descriptionOfBlock:(id)block
{
    NSMethodSignature *blockSignature = methodSignatureFromBlock(block);
    NSUInteger argsCount = blockSignature.numberOfArguments;
    
    NSMutableString *blockFormatDesc = [NSMutableString stringWithString:@"typedef "];

    NSString *blockReType = ocTypeFromSignatureCType(blockSignature.methodReturnType);
    [blockFormatDesc appendString:blockReType];
    [blockFormatDesc appendString:@"(^unknowBlockName) ("];
    
//    NSLog(@"block returnType %@",blockReType);
    
    for (NSUInteger i = 1; i < argsCount; i++) {
        const char *argCtype = [blockSignature getArgumentTypeAtIndex:i];
        NSString *octypeStr = ocTypeFromSignatureCType(argCtype);
        [blockFormatDesc appendString:octypeStr];
        if (i != argsCount -1) {
            [blockFormatDesc appendString:@", "];
        }
        //NSLog(@"block arg%zd : %@",i,ocTypeFromSignatureCType(argCtype));
    }
    [blockFormatDesc appendString:@");"];
    
    NSLog(@"full des: %@",blockFormatDesc);
    return blockFormatDesc;
}


+ (NSUInteger)blockInvokeFunctionPtr
{
    return 0;
}


@end
