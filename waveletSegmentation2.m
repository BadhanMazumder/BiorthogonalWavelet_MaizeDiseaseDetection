function segmented_image = waveletSegmentation2(src)
%wavelet decomposition
[c,s]=wavedec2(src,1,'bior3.3');
%level-1
[H1,V1,D1] = detcoef2('all',c,s,1);
A1 = appcoef2(c,s,'bior3.3',1);
k= A1/380;
%segmentation
mask=(k(:,:,2)>k(:,:,1)) & (k(:,:,2)>k(:,:,3));
segmented_image=bsxfun(@times, k, cast(imcomplement(mask), 'like', k));
%showImage
%imshow(segmented_image);title('Segmented Image');
end