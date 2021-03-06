function [major_axis minor_axis eigval]=  fitEllipseToBoundary(bounds)
%FITELLIPSETOBOUNDARY calculates the axes of an ellipse fit to a boundary
% for a set of objects
%
% [major_axis minor_axis]=  fitEllipseToBoundary(bounds).
% bounds is a struct with bounds().r storing the x-axis location of points
% and bounds().c storing the y-axis location of points.
%
% Returns the major and minor axis of the object as determined by fitting an
% ellipse to the boundary of the object
%
% Author: Rachel E. Sparks
% Date:   October, 20, 2012

major_axis = zeros([ length(bounds) 2]);
minor_axis = zeros ([length(bounds) 2]);
eigval = zeros ([length(bounds) 2]);


for i=1:length(bounds);
    %         [components,~,e] = princomp([bounds(i).r; bounds(i).c]'); %
    %         Changed by Patrick Leo, September 2017 since princomp is being
    %         removed from Matlab
    [components,~,e] = pca([bounds(i).r; bounds(i).c]','Algorithm','svd','Economy',false); %
    
    major_axis(i,:) = components(:,1);
    minor_axis(i,:) = components(:,2);
    eigval = e(1);
    
end

end