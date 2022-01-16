package main

import (
	"io"
	"log"
	// "net"
	// "os"
)

func main() {
	// conn ,err := net.Dial("tcp", "localhost:8080")
	// if err != nil {
	// 	log.Fatal(err)
	// }
	// done := make(chan struct{})

	// func () {
	// 	io.Copy(os.Stdout, conn)
	// 	log.Printf("done")
	// 	done <- struct{}{}
	// }()

	// mustCopy(conn, os.Stdin)
	// c := conn.(*net.TCPConn)
	// c.CloseWrite()
	// <-done
	
	naturals := make(chan int)
	squares := make(chan int)

	//Counter
	go func() {
		for x:=0; x < 100; x++ {
			naturals <- x
		}
		close(naturals)
	}()

	// Square
	go func() {
		for x := range naturals {
			squares <- x*x
		}

		defer close(squares)
	}()

	// Print
	for x:= range squares {
		log.Println(x)
	}

}

func mustCopy(dst io.Writer, src io.Reader) {
	if _,err := io.Copy(dst, src); err != nil {
		log.Fatal(err)
	}
}

