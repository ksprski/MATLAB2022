function p = polynom(a)
%POLYNOM Polynomial class constructor.
% p = POLYNOM(v) creates a polynomial object from the vector v,
% containing the coefficients of descending powers of x.
if nargin == 0
    p.c = [];
    p = class(p,'polynom');
elseif isa(a,'polynom')
    p = a;
else
    a = a(:).';
    ind = find(a~=0);
    if ~isempty(ind)
        p.c = a(ind(1):end);
    else
        p.c = [];
    end
    p = class(p,'polynom');
end