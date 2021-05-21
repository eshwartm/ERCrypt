//
//  ERCrypt.m
//
//  Created by Eshwar Ramesh on 20/05/21.
//

#import "ERCrypt.h"
#import <CommonCrypto/CommonCryptor.h>


@implementation ERCrypt

- (NSData *)crypt:(NSData *)dataIn
                  iv:(NSData *)iv
                 key:(NSData *)key
             context:(CCOperation)encryptOrDecrypt
{
    CCCryptorStatus ccStatus   = kCCSuccess;
    size_t          cryptBytes = 0;    // Number of bytes moved to buffer.
    NSMutableData  *dataOut    = [NSMutableData dataWithLength:dataIn.length + kCCBlockSizeAES128];

    ccStatus = CCCrypt( encryptOrDecrypt,
                       kCCAlgorithmAES128,
                       kCCOptionPKCS7Padding,
                       key.bytes,
                       kCCKeySizeAES128,
                       iv.bytes,
                       dataIn.bytes,
                       dataIn.length,
                       dataOut.mutableBytes,
                       dataOut.length,
                       &cryptBytes);

    if (ccStatus != kCCSuccess) {
        NSLog(@"CCCrypt status: %d", ccStatus);
    }

    dataOut.length = cryptBytes;

    return dataOut;
}

- (NSString *)AESEncrypt:(NSString *)dataIn
                    iv:(NSString *)iv
                   key:(NSString *)key
{
    NSData *actualData = [dataIn dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [self crypt:actualData iv:ivData key:keyData context:kCCEncrypt];
    return [encryptedData base64EncodedStringWithOptions:0];
}

- (NSString *)AESDecrypt:(NSString *)dataIn
                    iv:(NSString *)iv
                   key:(NSString *)key
{
    NSData *actualData = [dataIn dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decryptedData = [self crypt:actualData iv:ivData key:keyData context:kCCDecrypt];
    return [decryptedData base64EncodedStringWithOptions:0];
}

@end
