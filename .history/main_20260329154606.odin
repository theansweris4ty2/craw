package main

// import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {

	for 1 in 0 ..= 10 {
		k2.init(1200, 780, "Crawling Chaos")
		k2.clear(k2.BLUE)
		k2.present()
		defer k2.shutdown()
	}
}
