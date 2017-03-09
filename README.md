## Description

 Compute the product of two multidimensional arrays in Matlab.

 Note: If you need the result in a different order, use permute, see
       example 4.


# Example 1

```
 C_{ac} = A_{ab} B_{bc}

 sum over second index of A and first index of B

 C = tensor_mult(A, B, 2, 1);

 This is equivalent to C = A * B
```

# Example 2

```
 C_{bc} = A_{ab} B_{ac}

 sum over first index of A and first index of B

 C = tensor_mult(A, B, 1, 1);

 This is equivalent to C = A.' * B
```

# Example 3

```
 C_{cedf} = A_{abce} B_{dfab}
               1234     1234
               ^^         ^^

 sum over first  index of A and third  index of B and
 sum over second index of A and fourth index of B

 C = tensor_mult(A, B, [1 2], [3 4]);
```

# Example 4

```
 C_{decf} = A_{abce} B_{dfab}
               1234     1234
               ^^         ^^

 sum over first  index of A and third  index of B and
 sum over second index of A and fourth index of B
 reorder C_{cedf} -> C_{decf}

 C = permute(tensor_mult(A, B, [1 2], [3 4]), [3,2,1,4]);

```

# Example 5

```
 C_{cedf} = A_{cbea} B_{dfab}
               1234     1234
                ^ ^       ^^
 sum over the fourth index of A and third  index of B and
 sum over the second index of A and fourth index of B

 C = tensor_mult(A, B, [4 2], [3 4]);
```

# Example 6

```
 C_{abcdefg} = A_{abc} B_{defg}

 outer product

 C = tensor_mult(A, B, [], []);
```


