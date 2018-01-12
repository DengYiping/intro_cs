#include<stdio.h>
#include<unistd.h>
int main(int argc, char** argv){
    for(; argc > 1; argc--){
        if(0 == fork()){
            (void) fork();
        }
    }
    printf("fuck");
    return 0;
}
