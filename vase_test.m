% This script can be run out of the box in Octave or Matlab
%
% This tests the cameras and scans.
%
% The scan is shown on top of the image in magenta. The ground-truth edges
% obtained by editing the scan to remove homogeneous regions is in blue (a
% subset of the original scan).
%
%
% The scan coordinates are in the camera global coordinates.
%
%

% may have to gunzip pts-40.txt.gz first

X = load('pts-40.txt.gz');
E = load('vase-edge-gt3-017.txt.gz');
P = load('cameras/Img046_10.projmatrix'); % may want to use [K,R,T] = vgg_KR_from_P(P), seach the internet
im=imread('images/Img046_10.jpg');
Xh = [X ones(size(X,1),1)];
x = (P*(Xh'))';
x = [x(:,1)./x(:,3) x(:,2)./x(:,3)];
Eh = [E ones(size(E,1),1)];
edg = (P*(Eh'))';
edg = [edg(:,1)./edg(:,3) edg(:,2)./edg(:,3)];
a=im; for i=1:size(x,1); a(round(x(i,2)),round(x(i,1)),2) = 1; end
      for i=1:size(edg,1); a(round(edg(i,2)),round(edg(i,1)), 1) = 1; end
imshow(a)
