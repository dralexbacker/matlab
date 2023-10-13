function plotlines(matrix)
% PLOTLINES - Plots each line of MATRIX in a separate subplot in current figure

Nlin=size(matrix,1);
for lin=1:Nlin,
    subplot(Nlin,1,lin)
    plot(matrix(lin,:))
end
