package utils

func Test1Map() map[string]int {
	return make(map[string]int)
}

type Graph map[string]map[string]bool

func (g Graph) AddEdge(from ,to string) {
	edges := g[from]
	if edges == nil {
		edges = make(map[string]bool)
		g[from] = edges
	}
	edges[to] = true
}

func (g Graph) HasEdge(from, to string) bool {
	return g[from][to]
}