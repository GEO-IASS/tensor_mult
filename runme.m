clear 

A = randn(30,20,10);
B = randn(50,10,30,20);

C1 = tensor_mult(A, B, [2 3], [4 2], [2,1,3]);

C2 = tmult(A, [2 -1 -2], B, [1 -2 3 -1]);

C3 = tprod(A, [2 -1 -2], B, [1 -2 3 -1]);


norm(reshape(C1 - C2, numel(C1), 1))
norm(reshape(C1 - C3, numel(C1), 1))
