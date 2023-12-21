#include <map>
#include <cstdio>
#include <iostream>

int main(){
	std::map<int, int> map;
	map[2] = 3;
	int d = map.at(2);
	std::cout << d << std::endl;
	return 0;
}
