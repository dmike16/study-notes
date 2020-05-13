package utils

import (
	"crypto/sha256"
	"math"
)

func ArrayExample() int {
	var q = [...]int{1, 2, 3}
	var sum int
	for _, v := range q {
		sum += v
	}

	return sum
}

func CompareSHA256(x1 string, x2 string) int {
	var sha256x1 = sha256.Sum256([]byte(x1))
	var sha256x2 = sha256.Sum256([]byte(x2))
	var diffBytes int
	for i,v := range sha256x1 {
		if v != sha256x2[1] {
			diffBytes += int(math.Abs(float64(pc[v] - pc[sha256x2[i]])))
		}
	}

	return diffBytes
}

var pc [256]byte

func init() {
	for i := range pc {
		pc[i] = pc[i/2] + byte(i&1)
	}
}

func GetPopulationOf(i int) byte {
	return pc[i]
}

func GetPopulation() [256]byte {
	return pc
}

func PopCount(x uint64) int {
	return int(pc[byte(x>>(0*8))] +
		pc[byte(x>>(1*8))] +
		pc[byte(x>>(2*8))] +
		pc[byte(x>>(3*8))] +
		pc[byte(x>>(4*8))] +
		pc[byte(x>>(5*8))] +
		pc[byte(x>>(6*8))] +
		pc[byte(x>>(7*8))])
}
