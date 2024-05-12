function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%


% Find number of occurences of each element in idx
[centroid_idx, ~, uidx] = unique(idx(:));   % centroid_idx represents centroid index (1 - K)
counts = accumarray(uidx, 1);			    % counts represents count of elements for each centroid_idx

% Create a matrix to be K x 2 holding the value of K and its corresponding count
idx_combined_count = [centroid_idx counts];
% Sort the combined idx matrix according to their values of K in ascending order
idx_sorted_count = sortrows(idx_combined_count, [1]);

% Loop through each centroid
for i = 1:K
	sum = zeros(1, n);
	for j = 1:m
		% Count the number of data points close to centroid i and sum their X values
		if idx(j) == i
			sum += X(j, :);
		end
	end
	% Calculate mean of data points
	centroids(i, :) = sum ./ idx_sorted_count(i, 2);
end



%%%% For shorter code, use this by uncommenting the code below
%for k=1:K
%    indexes = idx == k;
%    centroids(k, :) = mean(X(indexes, :));
%end;



% =============================================================


end

