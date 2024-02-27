function r = roots(p)
% POLYNOM/ROOTS. ROOTS(p) is a vector containing the roots of p.
if ~isempty(p.c)
    r = unique(roots(p.c));
else
    r = [];
end