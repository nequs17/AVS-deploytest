package main

/*
#include <stdio.h>

void hello() {
    printf("Hello, World from Jenkins\n");
}
*/
import "C"

func main() {
	C.hello()
}
