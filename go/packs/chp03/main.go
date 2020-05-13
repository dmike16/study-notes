package main

import (
	"fmt"
	"os"
	"com.github/dmike16/study-notes/composite-types/utils"
	"com.github/dmike16/study-notes/composite-types/utils/github"
)

func main(){
	var sum = utils.ArrayExample()
	fmt.Println(sum)

	fmt.Printf("diffBytes = %d\n", utils.CompareSHA256("x", "x_"))

	for _, a := range os.Args {
		fmt.Println(a)
	}
	fmt.Println(5&1)
	x := 256
	fmt.Println(x >> (1*8))
	fmt.Printf("%d\n", utils.PopCount(256))
	// input := bufio.NewScanner(os.Stdin)
	// for input.Scan() {
	// 	fmt.Println(input.Text())	
	// }
	var slice1, slice2 = utils.Test1Slice();
	fmt.Printf("s1 = %s\n s2 = %s\n", slice1, slice2)
	fmt.Printf("len = %d\n cap = %d\n", len(slice1), cap(slice1))
	fmt.Printf("len = %d\n cap = %d\n", len(slice2), cap(slice2))
	fmt.Printf("s1 = %s\n", slice1[:4])

	var slice3 = slice1[:4]
	utils.RotateLeftByN(2, slice3)
	fmt.Printf("s1 = %s\n", slice3[:4])
	slice3 = append(slice3, "paperinick")
	fmt.Printf("s1 = %s\n", slice3)
	fmt.Printf("len = %d\n cap = %d\n", len(slice3), cap(slice3))

	var testMap = utils.Test1Map();
	testMap["lol"] = 12
	for k,v := range testMap {
		fmt.Printf("k = %s -> v %d \n", k, v)	
	}
	var graph utils.Graph = make(map[string]map[string]bool)
	graph.AddEdge("pippo", "pluto")
	fmt.Printf("Has(%s) = %t\n", "pippo", graph.HasEdge("pippo", "pluto"))

	result, err  := github.SearchIssues([]string{"repo:golang/go", "is:open", "json", "decoder"})
	fmt.Printf("result = %d - %v\n", result.TotalCount, err)
}