# 382_Prolog

## Purpose ##
The goal of this was to use a language in the logic paradigm and to become familiar with prolog.

## Problems ##
inorder(Tree, In) : returns true when In is the items of Tree in inorder traversal\
subtree(Sub, Tree) : returns true if Sub is a subtree of Tree\
sumtree(TreeOfIntegers, Sum) : returns true if sum is the sum of TreeOfIntegers, or returns the sum of the Tree\
ordered(TreeOfIntegers) : returns true if TreeOfIntegers is a bianry tree and if there are no repeats\
search(TreeOfIntegers, Key) : returns true if Key is in TreeOfIntegers\
substitute(X, Y, TreeX, TreeY): returns TreeY with TreeX, but subsituting X for Y

## How to Test ##
I used SWI-Prolog (https://www.swi-prolog.org/) to write and run these problems. In there you can use the preset Trees (Tree1, Tree2, Tree3) in order to do testing.
After loading the file, you are able to run these by using the following commands. 

### Examples ###
tree1(T), inorder(T, Es).\
tree1(T), subtree(T, T).\
tree1(T), subtree(tree(2, void, void), T).\
tree1(T), sumtree(T, S).\
tree1(T), substitute(1, 4, T, T2).
