function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%


% Initialize c to be a K x 1 vector
distance = zeros(K, 1);
% Loop through every training example
for i = 1:size(X,1)
	% Loop through every centroid
	for j = 1:K
		% Store the distance to each centroid in c
		distance(j) = sum((X(i, :) - centroids(j, :)) .^ 2);
	end
	% Get index of closest clusteroid based on minimum error
	[minval, index] = min(distance);
	% Store index of closest clusteroid for the example
	idx(i) = index;
end



% =============================================================

end

