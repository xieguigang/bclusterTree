# raw data
x   = runif(100);
y   = runif(100);
seq = lapply(1:length(x), function(i) list(v = c(x[i], y[i])));

# define compares order
index = function(p1, p2) {
	d = sqrt(sum((p1$v - p2$v) ^ 2));
	
	if (d <= 0.3) {
		0
	} else if (d <= 0.6) {
		1
	} else {
		-1
	}
}

# run clustering
c = bcluster(seq, index);

# plot result data
plot(x, y, pch = 2, col = "white");

i       = 1;
colors1 = c(
	"red", "blue", "green", "yellow", "steelblue",
	"purple", "black", "orange", "gray", "cyan",
	"pink", "skyblue", "limegreen"
);

for(name in names(c)) {
	points(x[c[[name]]], y[c[[name]]], pch=25, col=colors1[i], bg=colors1[i]);
	i = i + 1;
}

