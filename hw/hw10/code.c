#include<stdio.h>
#include<unistd.h>
int main(int argc, char** argv){
    int fd[2];
    int depth = 0; /* keep track of number of generations from original */
    int i;
    pipe(fd);
    for(; argc > 1; argc--){
        if(0 == fork()){
            (void) fork();
            write(fd[1], &i, 1);
            depth += 1;
        }
    }
    close(fd[1]);  /* close the pipe so that it will not wait forever */ 
    if( depth == 0 ) { /* original process */
      i=0;
      while(read(fd[0],&depth,1) != 0)
        i += 1;
      printf( "%d total processes spawned\n", i);
    }
    return 0;
}
