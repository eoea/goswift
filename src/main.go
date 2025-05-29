package main

import (
	"C"
)

//export Add
func Add(a, b int) int {
	return a + b
}

//export Subtract
func Subtract(a, b int) int {
	return a - b
}

func main() {}
