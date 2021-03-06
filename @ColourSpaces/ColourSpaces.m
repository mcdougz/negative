classdef ColourSpaces
    % converts between different colour spaces. may switch to OOP
    properties
    end
    methods (Static = true)
        function y = normalize(val)
            y = double(val)/255.0;
        end
        function y = denormalize(val)
            y = double(val)*255.0;
        end
        
        % multiple return from stackoverflow.com/questions/4188139/matlab-multiple-return-values-from-a-function
        % TODO: wont need this anymore because i found rgb2hsv
        function [hue,sat,val] = RGBtoHSV(r,g,b)
            % takes an un-normalized RGB and converts it into HSV
            r = ColourSpaces.normalize(r);
            g = ColourSpaces.normalize(g);
            b = ColourSpaces.normalize(b);
            
            [hue,sat,val] = rgb2hsv([r,g,b]);
        end
    end
end