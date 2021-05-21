# ERCrypt
Encrypt/Decrypt a piece of data with Key and IV using Apple's CommonCryptor


Usage:

Encryption:
NSString *encryptedBase64String = [[ERCrypt alloc] AESEncrypt:sampleString iv:iv key:key];

Decryption:
NSString *decryptedBase64String = [[ERCrypt alloc] AESDecrypt:sampleString iv:iv key:key];
