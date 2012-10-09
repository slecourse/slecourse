grammar Not42;
options { k = 42; }
s : 'a'* 'x' | 'a'* 'y';

// Error! Infinite look ahead is needed.
