package main

// import "core:fmt"
import k2 "vendor:karl2d"

main :: proc() {


	k2.init(1200, 780, "Crawling Chaos")
	k2.clear(k2.BLUE)
	defer k2.shutdown()

	for {
		k2.draw_text("Hello World", {100, 100}, 30)
		k2.present()
	}

}
