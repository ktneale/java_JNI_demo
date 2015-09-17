#include <jni.h>
#include <stdio.h>
#include "native_crypt.h"

unsigned long long factorial(unsigned int n)
{
    if (n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

JNIEXPORT void JNICALL Java_Client_print(JNIEnv * env, jobject obj)
{
    printf("Hello World!\n");
    printf("Result: %d\n", (int) factorial(6));
    return;
}
