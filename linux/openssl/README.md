# Lessons

## Show error string
Normally you'll get `error:0406506C:rsa routines:func(101):reason(108)`, but what does it mean?

In order to show the useful error message, open terminal and type the following command
```sh
$ openssl errstr 0406506C
error:0406506C:rsa routines:RSA_EAY_PRIVATE_DECRYPT:data greater than mod len
```

Reference: [PEM_read_RSAPrivateKey returns “Illegal Seek” when decrypting using OpenSSL libs in C](http://stackoverflow.com/questions/12885680/pem-read-rsaprivatekey-returns-illegal-seek-when-decrypting-using-openssl-libs#answer-12886305)
