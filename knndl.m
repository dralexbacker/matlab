function [each_class, ensemble_class, nearest_sample_index, knnmat] = ...
	knn(sampledata, testdata, k)
% KNN	K-nearest neighbor rule for classification
%	Usage:
%	[EACH_CLASS, ENSEMBLE_CLASS, NEAREST_SAMPLE_INDEX] = KNN(SAMPLE, INPUT, K)
%
%	SAMPLE: Sample data set (The last column is the desired class of each
%		sample vector. The values of the last column are assumed to
%		be integers ranging from 1 to N.)
%	INPUT: Test input matrix (each row is an input vector)
%	K: the "k" in "k nearest neighbor"
%	EACH_CLASS: A vector denoting the KNN output class of each input vector
%	NEAREST_SAMPLE_INDEX: Index of SAMPLE that are closest to INPUT
%	ENSEMBLE_CLASS: A scalar denoting the KNN output class of all input
%		vectors that are assumed to be of the same class
%		(A voting mechanism is invoked to determine a scalar value
%		between 1 and N.)

%	Roger Jang, 9703xx, 990613, 991215 

if nargin == 0, selfdemo; return; end
if nargin < 3, k = 1;, end

feature_n = size(sampledata,2)-1;
sample_input = sampledata(:, 1:feature_n);
sample_output = sampledata(:, feature_n+1);
out_class = countele(sample_output);	% possible output class
class_n = length(out_class);
test_n = size(testdata, 1);		% no. of test input vectors
test_input = testdata(:, 1:feature_n);	% strip out class info, if any

% Euclidean distance matrix between sample_input and test input vector
distmat = vecdist(sample_input, test_input);

% knnmat(i,j) = class of i-th nearest point of j-th test input vector
% (The size of knnmat is k by test_n.)
[junk, nearest_sample_index] = sort(distmat, 1);
% The following "reshape" is necessary if k == 1.
knnmat = reshape(sample_output(nearest_sample_index(1:k,:)), k, test_n);

% class_count(i,j) = number of class-i points in j-th test input's neighborhood
% (The size of class_count is class_n by test_n.)
class_count = zeros(class_n, test_n);
for i = 1:test_n,
	[sorted_element, element_count] = countele(knnmat(:,i));
	class_count(sorted_element, i) = element_count;
end

[junk, ensemble_class] = max(sum(class_count, 2));
[junk, each_class] = max(class_count, [], 1);
each_class = each_class';

function selfdemo
	load iris.dat
	data_n = size(iris, 1);
	design = iris(1:2:data_n, :);
	test   = iris(2:2:data_n, :);
	design_n = size(design, 1);
	test_n   = size(test, 1);
	fprintf('Use of KNN for Iris data:\n');
	fprintf('\tSize of design set (odd-indexed data)= %d\n', design_n);
	fprintf('\tSize of test set (even-indexed data) = %d\n', test_n);
	fprintf('\tRecognition rates as K varies:\n');
	max_k = 15;
	for k = 1:max_k,
		computed = feval(mfilename, design, test, k);
		correct_count = sum(test(:, end) == computed);
		recog(k) = correct_count/test_n;
		fprintf('\t%d-NNR ===> 1-%d/%d = %.2f%%.\n', ...
			k, test_n-correct_count, test_n, recog(k)*100);
	end
	plot(1:max_k, recog*100, 'b-o');
	grid on;
	title('Recognition rates of Iris data using K-NNR');
	xlabel('K');
	ylabel('Recognition rates (%)');
