%%%%%%%%%%%%%%%%%%%%%%%%%%
% tree.pl
% https://gfx.cse.taylor.edu/courses/cos382/assignments/11_Paradigm_LogicProlog
% The goal of this assignment is to write a collection of Prolog rules
% to represent and manipulate binary trees.
%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Starter code

% tree(Tree)
% - Tree is a binary tree.

tree(void).
tree(tree(_,Left,Right)) :-  tree(Left),
                             tree(Right).


% tree_member(Element,Tree)
% - Element is an element of the binary tree Tree.

tree_member(X,tree(X,_,_)).
tree_member(X,tree(_,Left,_)) :- tree_member(X,Left).
tree_member(X,tree(_,_,Right)) :- tree_member(X,Right).



% preorder(Tree,Pre)
% - Pre is a list of elements of Tree accumulated during a preorder
% traversal.

preorder(tree(X,L,R),Xs) :- preorder(L,Ls), preorder(R,Rs),
                            append([X|Ls],Rs,Xs).
preorder(void,[]).


% inorder(Tree, In)
% - In is a inorder traversal of Tree.

inorder(tree(X,L,R),Xs) :- inorder(L,Ls), inorder(R,Rs),append(Ls,[X|Rs],Xs).
inorder(void, []).

% substitute(X, Y, TreeX, TreeY)
% - TreeY is result of TreeX after substitution of X to Y

substitute(_, _, void, void).
substitute(F, H, tree(J, JL,JR), tree(J, P,K)) :- J\==F, substitute(F,H,JL, P), substitute(F,H, JR,K).
substitute(X, Y, tree(X,L,R), tree(Y,L2,R2)) :- substitute(X, Y, L, L2), substitute(X, Y, R, R2).

% subtree(Sub, Tree)
% returns true when sub is a subtree of Tree

subtree(void, void).
subtree(T, T).
subtree(P,tree(_,L,R)) :- subtree(P, L); subtree(P, R).
% How can i also incorporate the values while recurssivly checking with
% tree?

% sumtree(Tree, Sum)
% calculate or verify the sum of the ints in the tree

sumtree(void, 0).
sumtree(tree(Val, void, void), Val).
sumtree(tree(X, L, R), Sum):- sumtree(L, Sl), sumtree(R, Sr), Sum is X+Sl+Sr.

% search(Tree, Key)
% returns true if the key is found in the tree

search(void, void).
search(tree(X, _, _),X).
search(tree(X, L, R),Y) :- X \== Y, search(L,Y); search(R,Y).



% append(Xs,Ys,XsYs)
% - XsYs is the result of appending the lists Xs and Ys.

append([],Ys,Ys).
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).

% ordered(Tree)
% evaluates if the tree is ordered without duplicates

ordered(void).
ordered(tree(_, void, void)).
ordered(T) :- inorder(T, N), ascend(N).

% ascend(list).
% this is a helper function for ordered where it tells us if the list is
% ordered
ascend([]).
ascend([_|[]]).
ascend([H1,H2|T]) :- H1 < H2, ascend([H2|T]).

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sample trees

%
%    tree1       tree2         tree3
%
%      1           4             1
%     / \         / \           / \
%    2   3       5   6         2   3
%                             / \
%                            5   6
%                               /
%                              7
%

tree1(tree(1,tree(2,void,void),tree(3,void,void))).
tree2(tree(4,tree(5,void,void),tree(6,void,void))).
tree3(
        tree(   1,
                tree(   2,
                        tree(5,void,void),
                        tree(   6,
                                tree(7,void,void),
                                void
                        )
                ),
                tree(3,void,void)
        )
).
tree4(tree(6,tree(5,void,void),tree(8,void,void))).

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Place your code here


% inorder/2
% subtree/2
% sumtree/2
% ordered/1
% search/2
% substitute/4


% Additional test data

















