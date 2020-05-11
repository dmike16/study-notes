package utils

type Flags uint8

const (
	FlagUp Flags = 1 << iota
	FlagBroadcast
	FlagLoopback
	FlagPointToPont
	FlagMulticast
)

func (v Flags) IsUp() bool {
	return v&FlagUp == FlagUp
}

func (v *Flags) TurnDown() {
	*v &^= FlagUp
}

