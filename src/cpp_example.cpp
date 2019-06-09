#include <fstream>
#include <iostream>
#include <string>

int main(int argc,char **argv){
    std::ios::sync_with_stdio(false);
    std::string filename;
    if (argc == 2){
        filename = argv[1];
    }else{
        std::cout<<"Usage: " << argv[0] << "filename" <<std::endl;
        exit (-1);
    }
    std::ifstream file(filename);
    if (file.is_open()) {
        std::string line;
        while (getline(file, line)) {
            // using printf() in all tests for consistency
            std::cout << line << "\n";
        }
        file.close();
    }
}
