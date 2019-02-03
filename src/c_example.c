#include <stdio.h>
#include <stdlib.h>

int main(int argc,char **argv){
    char *filename;
    if (argc == 2){
        filename = argv[1];
    }else{
        // std::cout<<"Usage: " << argv[0] << "filename" <<std::endl;
        exit (-1);
    }
    FILE* fp = fopen(filename, "r");
    if (fp == NULL)
        exit(EXIT_FAILURE);

    char* line = NULL;
    size_t len = 0;
    while ((getline(&line, &len, fp)) != -1) {
        // using printf() in all tests for consistency
        printf("%s", line);
    }
    fclose(fp);
    if (line)
        free(line);
}
