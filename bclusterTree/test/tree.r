x = runif(100);

index = function(a, b) {
	if (abs(a - b) <= 0.1) {
		0
	} else if (a > b) {
		1
	} else {
		-1
	}
}

buildBTree(x, index)