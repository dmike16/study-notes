package main

import (
	"com.github/dmike16/study-notes/methods-declaration/utils"
	"fmt"
)

func main() {
	triangle := utils.Path{
		{X: 1, Y: 1},
		{X: 5, Y: 1},
		{X: 5, Y: 4},
		{X: 1, Y: 1},
	}
	fmt.Println(triangle.Distance())
	triangle = nil
	fmt.Println(triangle.Distance())
}
