package utils

import "bytes"

func InvertString(s string) string{
	var buf  bytes.Buffer
	for i := len(s) -1 ; i >= 0; i-- {
		buf.WriteByte(s[i])
	}
	return buf.String()
}