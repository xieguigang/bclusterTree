x = runif(100);

index = function(a, b) {
	if (abs(a - b) <= 0.3) {
		0
	} else if (a > b) {
		1
	} else {
		-1
	}
}

str(bcluster(x, index));