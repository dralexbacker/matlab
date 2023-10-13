function [alignedvalues1,alignedvalues2,commonalignbyvalues,IA,IB] = matchcolumns(valuestoalign1,valuestoalign2,alignby1,alignby2)
% [alignedvalues1,alignedvalues2,alignbyvalues,IA,IB] = matchcolumns(valuestoalign1,valuestoalign2,alignby1,alignby2)
%   Align values in VALUESTOALIGN1 and VALUESTOALIGN2 so each row
%   corresponds to a common value in ALIGNBYVALUES
% Only rows with ALIGNBYVALUES in both datasets are returned
% ALIGNBY can be cell vectors or vectors
% IA & IB are the indices kept of ALIGNBY1 and ALIGNBY2

if ~isequal(size(valuestoalign1),size(alignby1)),
    if isequal(size(valuestoalign1),size(alignby1')),
        alignby1=alignby1';
    else
    error('VALUESTOALIGN1 & ALIGNBY1 must be same size')
    end
end
if ~isequal(size(valuestoalign2),size(alignby2)),
    if isequal(size(valuestoalign2),size(alignby2')),
        alignby2=alignby2';
    else
    error('VALUESTOALIGN2 & ALIGNBY2 must be same size')
    end
end

% Sort by alignby unncessary because of next step -not necessary, but may make it faster
% [alignby1,i]=sort(alignby1);
% valuestoalign1=valuestoalign1(i);
% 
% [alignby2,j]=sort(alignby2);
% valuestoalign2=valuestoalign2(j);

% Convert empty arrays into empty strings so UNIQUE & INTERSECT don't give
% error:
if ~iscellstr(alignby1),
    for i=1:length(alignby1),
        if isempty(alignby1{i}),
            alignby1{i}='';
        end
    end
end
if ~iscellstr(alignby2),
    for i=1:length(alignby2),
        if isempty(alignby2{i}),
            alignby2{i}='';
        end
    end
end

% Keep only intersection
[commonalignbyvalues,IA,IB]=intersect(alignby1',alignby2');
alignby1=alignby1(IA);
alignby2=alignby2(IB);
alignedvalues1=valuestoalign1(IA);
alignedvalues2=valuestoalign2(IB);
commonalignbyvalues=commonalignbyvalues';