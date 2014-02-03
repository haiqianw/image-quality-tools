function [SSIM_Value] = sim_ssim()
    % go to image directory not the best way but works %
    currDir = cd ('images');
    [threshold] = textread('threshold.data', '%s');
    n = 100;
    SSIM_Value = zeros(n, 5);
    images = 3; % global variable for the image set 
    for i = 1:images
        src = strcat('image',int2str(i),'*Orig.jpg');
        origFile = dir(src);
        for j =  1:length(threshold)
            copy = strcat('image',int2str(i),'*', threshold{j}, 'Copy.jpg');
            fileNames = dir(copy);
            origFileName = imread(origFile(1).name);
            filename = fileNames.name;
            SSIM_Value(i, j) = ssim(origFileName, imread(filename));
        end
    end
    SSIM_Value = SSIM_Value(1:i, :);
    % go to src directory %
    cd ..;
end