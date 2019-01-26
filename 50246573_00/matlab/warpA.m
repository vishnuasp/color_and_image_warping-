function [ warp_im ] = warpA( im, A, out_size )
%%
% warp_im=warpAbilinear(im, A, out_size)
% Warps (w,h,1) image im using affine (3,3) matrix A 
% producing (out_size(1),out_size(2)) output image warp_im
% with warped  = A*input, warped spanning 1..out_size
% Uses nearest neighbor mapping.
% INPUTS:
%   im : input image
%   A : transformation matrix 
%   out_size : size the output image should be
% OUTPUTS:
%   warp_im : result of warping im by A
warp_imsd=zeros(200,150);
%% This Code gives holes in the output image
%  for i= 1:size(im,1)
%      for j=1:size(im,2)
%         transForm=A*[j; i; 1];
%         transForm(1)=(round(transForm(1)));
%         transForm(2)=(round(transForm(2)));
%             if((transForm(1)>0) && (transForm(2)>0))
%                  warp_ims(transForm(2),transForm(1))=im(i,j);
%             end
%      end
%  end
% warp_ims=warp_ims(1:200,1:150);
%% This Code Displays required output image
 for i= 1:size(im,1)
     for j=1:size(im,2)
         transForm=inv(A)*[j; i; 1];
         transForm(1)=round(transForm(1));
         transForm(2)=round(transForm(2));
            if((transForm(1)>0) && (transForm(2)>0) && (transForm(1)<=150) && (transForm(2)<=200) )
              % warp_imsd(transForm(1),transForm(2))=im(i,j);
               warp_imsd(i,j)=im(transForm(2),transForm(1));
            end
     end
 end
warp_im = warp_imsd(1:200,1:150);
end