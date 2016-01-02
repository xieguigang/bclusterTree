
#' Build a binary tree
#'
#' @param compares a comparision function that compares the order of
#'     any two elements in objects list. this function should generates
#'     3 values for build a tree cluster: 0 for identical, means clustering
#'     1 for great than, means append to right node and -1 means less than,
#'     which will append to left node
#'
#' @param objects this parameter should be an object list.
#' @param key a lambda function that create index key of the element object 
#'     in the objects parameter.
#'
buildBTree = function(objects, key, compares) {
	root = binaryTree.node(1);
	
	for(item in objects) {
		index = key(item);
		
	}
}

