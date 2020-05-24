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
	
	var x, y utils.IntSet
	
	x.Add(1)
	x.Add(144)
	x.Add(9)
	fmt.Println(x.String())

	y.Add(9)
	y.Add(42)
	fmt.Println(y.String())

	x.UnionWith(&y)
	fmt.Println(x.String())
	fmt.Println(x.Has(42), y.Has(9))
}
