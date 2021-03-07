require(VisualBasic.R);

x = c("TTTTTc","AAAc","TGGGG","ATTTG","TTTTTTT",
"AAAAAAAA","ccccccccccc","GGGGGGGTGGGG","ccccccTTT",
"AAAAcccc","TGTGGGGG","GGGGGcccc","ATATATTTTAA",
"cccccccG","GGGGGGG","AAAAAATTTAA","ccccccTTccc"
);

index = function(t1, t2) {
	d = levenshtein.distance(t1, t2);
	d = 1 - d / ((nchar(t1) + nchar(t2)) / 2);
	
	if (d >= 0.5) {
		0
	} else if (d >= 0.3) {
		1;
	} else {
		-1;
	}
}

c = bclusterTree::bcluster(x, index)

for(name in names(c)) {
	print(name);
	print(x[c[[name]]]);
}