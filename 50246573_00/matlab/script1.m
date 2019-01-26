% Problem 1: Image Alignment

%% 1. Load images (all 3 channels)
red = load('..\data\red.mat');  % Red channel
green = load('..\data\green.mat');  % Green channel
blue = load('..\data\blue.mat');  % Blue channel

%% 2. Find best alignment
% Hint: Lookup the 'circshift' function
redData=red.red
greenData=green.green
blueData=blue.blue
rgbResult = alignChannels(redData, greenData, blueData);

%% 3. Save result to rgb_output.jpg (IN THE "results" folder)
imwrite(rgbResult, fullfile('..\results', 'rgb_output.jpg'));