function [rgbResult] = alignChannels(red, green, blue)
% alignChannels - Given 3 images corresponding to different channels of a
%       color image, compute the best aligned result with minimum
%       aberrations
% Args:
%   red, green, blue - each is a matrix with H rows x W columns
%       corresponding to an H x W image
% Returns:
%   rgb_output - H x W x 3 color image output, aligned as desired

% Write code here
%%Finding SSD with green channel as rigid/reference.
ssdRG=sum((double(green(:))-double(red(:))).^2);
ssdRG=mod(ssdRG,30);
ssdBG=sum((double(green(:))-double(blue(:))).^2);
ssdBG=mod(ssdBG,30);
%%Evaluating the best combination based on minimum displacement.
min=999999999999;
for i= 1:2
    for j=1:2
        if(mod(i,2)~=0)
            redDisp=-ssdRG;
        else
            redDisp=ssdRG;
        end
        if(mod(j,2)~=0)
            blueDisp=-ssdBG;
        else
            blueDisp=ssdBG;
        end
        redF=circshift(red,[redDisp 0]);
        blueF=circshift(blue,[blueDisp 0]);
        x=sum((redF(:)-blueF(:)).^2);
        if (min > x) 
            min=x;
            redF1=redF;
            blueF1=blueF;
        end
     end
end
        rgbResult=cat(3,redF1,green,blueF1);      
end
