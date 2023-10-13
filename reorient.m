function matrix = reorient(matrix,model)

% Reorients matrix to match model dimensions if there is a unique way to do it
% AB Mar 98
%
% See also MATLAB function RESHAPE. REORIENT(matrix,model) = RESHAPE(matrix,size(model,1),size(model,2))

sma = size(matrix);
smo = size(model);

if (sma==smo & sma([end:-1:1])==smo),
	error('Ambiguity: both matrices square')
elseif sma(1)==smo(2) | sma(2)==smo(1),
	matrix = matrix';
elseif ~(any(sma==smo) | any(sma([end:-1:1])==smo)),
	error('No dimension matches')
end
