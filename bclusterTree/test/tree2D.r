x = runif(100);
y = runif(100);

seq = lapply(1:length(x), function(i) list(v = c(x[i], y[i])));

dist = function(p1, p2) {
	sqrt(sum((p1$v - p2$v) ^ 2))
}

index = function(p1, p2) {
	d = dist(p1, p2);
	
	if (d <= 0.25) {
		0
	} else if (d <= 0.5) {
		1
	} else {
		-1
	}
}

c = bcluster(seq, index);

plot(x, y, pch = 2, col = "white");

colors1 = c("red","blue","green","yellow","purple","black", "gray","cyan","pink","skyblue", "limegreen");
colors2 = c("red","blue","green","yellow","purple","black", "gray","cyan","pink","skyblue", "limegreen");
i=1;

for(name in names(c)) {
	points(x[c[[name]]], y[c[[name]]], pch=25, col= colors1[i], bg=colors2[i]);
	i=i+1;
}