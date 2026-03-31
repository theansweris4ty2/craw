package main

import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {
	fmt.println("Hello World")
	k2.Init(1200, 780)
	k2.clear(k2.BLUE)
}
