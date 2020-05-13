package utils

var underlineArray = [...]string{"pippo", "pluto", "paperino", "zio"}

func Test1Slice() ([]string, []string){
	return underlineArray[0:2], underlineArray[2:]
}

func Reverse(slice []string){
	for i,j := 0 ,len(slice)-1; i < j; i,j = i+1, j-1{
		slice[i], slice[j] = slice[j], slice[i]
	} 
}

func RotateLeftByN(n int, slice []string) {
	Reverse(slice[:n])
	Reverse(slice[n:])
	Reverse(slice)
}