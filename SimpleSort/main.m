//
//  main.m
//  SimpleSort


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line = @"70.920 -38.797 14.354 99.323 90.374 7.581";
       
        BOOL isAscending = NO;
        
        NSMutableArray *arrayOfNumerStringsFromLine = [[line componentsSeparatedByString:@" "] mutableCopy];
        
        while (!isAscending) {
            
            NSInteger i = 0;
            for (i = 0; i < arrayOfNumerStringsFromLine.count - 1; i++) {
                NSString *num1String = [arrayOfNumerStringsFromLine objectAtIndex:i];
                NSString *num2String = [arrayOfNumerStringsFromLine objectAtIndex:i + 1];
                float num1 = [num1String floatValue];
                float num2 = [num2String floatValue];
            
                if (num1 > num2) {
                    [arrayOfNumerStringsFromLine removeObject:num1String];
                    [arrayOfNumerStringsFromLine insertObject:num1String atIndex:i + 1];
                }
            }
            // check for ascending order
            NSInteger j = 0;
            for (j = 0; j < arrayOfNumerStringsFromLine.count - 1; j++) {
                NSString *num1String = [arrayOfNumerStringsFromLine objectAtIndex:j];
                NSString *num2String = [arrayOfNumerStringsFromLine objectAtIndex:j + 1];
                float num1 = [num1String floatValue];
                float num2 = [num2String floatValue];
            
                if (num1 > num2) {
                    isAscending = NO;
                    break;
                }
                else {
                    isAscending = YES;
                }
            }
        }
        // build each line of respose into string
        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        for (NSString *numberString in arrayOfNumerStringsFromLine) {
            [solutionString appendFormat:@"%@ ",numberString];
        }
        NSRange lastSpaceRange = NSMakeRange(solutionString.length - 1, 1);
        [solutionString deleteCharactersInRange:lastSpaceRange];

        NSLog(@"%@\n", solutionString);
    }
    return 0;
}
