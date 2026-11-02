function are_equal = matcmp(A, B, toll)
if nargin < 3
    toll = 1e-7;
end
are_equal = all(abs(A - B) < toll, 'all');
end