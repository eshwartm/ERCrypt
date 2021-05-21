//
//  ERCrypt.h
//
//  Created by Eshwar Ramesh on 20/05/21.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@interface ERCrypt : NSObject

- (NSString *)AESEncrypt:(NSString *)dataIn
                    iv:(NSString *)iv
                   key:(NSString *)key;

- (NSString *)AESDecrypt:(NSString *)dataIn
                    iv:(NSString *)iv
                   key:(NSString *)key;

@end
