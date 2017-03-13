function C = tmult(A, pattern_A, B, pattern_B)

    if isempty(B)
        B = A;
    end
    
%     assert(numel(size(A)) == numel(pattern_A));
%     assert(numel(size(B)) == numel(pattern_B));

    [~, sum_idx_A_order] = sort(pattern_A(pattern_A < 0));
    [~, sum_idx_B_order] = sort(pattern_B(pattern_B < 0));
    
    sum_idx_A = find(pattern_A < 0);
    sum_idx_B = find(pattern_B < 0);
    
    sum_idx_A = sum_idx_A(sum_idx_A_order);
    sum_idx_B = sum_idx_B(sum_idx_B_order);
    
    sum_idx_A = reshape(sum_idx_A, 1, numel(sum_idx_A));
    sum_idx_B = reshape(sum_idx_B, 1, numel(sum_idx_B));
    
    [expand, perm] = sort([pattern_A(pattern_A > 0), pattern_B(pattern_B > 0)]);

    size_A = size(A);
    size_B = size(B);
    
    num_size_A = numel(size_A);
    num_size_B = numel(size_B);
    
    perm_A = 1:num_size_A;
    perm_B = 1:num_size_B;
    
    num_idx = size(sum_idx_A, 2);
    
    assert(isequal(size(sum_idx_A) , size(sum_idx_B) ));
    assert(isequal(size_A(sum_idx_A), size_B(sum_idx_B)));
    
    sum_dim = prod(size_A(sum_idx_A));

    for i = 1:num_idx
        perm_A = perm_A(perm_A~=sum_idx_A(i));
        perm_B = perm_B(perm_B~=sum_idx_B(i));
    end
    
    perm_A = [perm_A, sum_idx_A];
    perm_B = [sum_idx_B, perm_B];
    
    size_A(sum_idx_A) = [];
    size_B(sum_idx_B) = [];
    
    reshape_size = [size_A, size_B];
    
    if isempty(reshape_size)
        reshape_size = [1,1];
    end
    
    if numel(reshape_size) == 1
        reshape_size = [reshape_size, 1];
    end
    
    if isempty(perm) || numel(perm) == 1
        C = squeeze(reshape(...
            reshape(permute(A, perm_A), [prod(size_A), sum_dim]) * ...
            reshape(permute(B, perm_B), [sum_dim, prod(size_B)]), ...
            reshape_size));
    else
        C = permute(squeeze(reshape(...
            reshape(permute(A, perm_A), [prod(size_A), sum_dim]) * ...
            reshape(permute(B, perm_B), [sum_dim, prod(size_B)]), ...
            reshape_size)),perm);
    end
    if ~isempty(expand) & expand ~= 1
        size_C = size(C);
        if numel(expand) == 1
           final_reshape(expand) = max(size_C);
        else
            final_reshape(expand) = size_C;
        end
        final_reshape(final_reshape == 0) = 1;
        C = reshape(C, final_reshape);
    end

end