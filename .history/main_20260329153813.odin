package main

import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {
	fmt.println("Hello World")
	k2.init(1200, 780, "Crawling Chaos")
	k2.clear(k2.BLUE)
	k2.present()
}
