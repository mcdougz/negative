classdef ColourSpaces
    % converts between different colour spaces. may switch to OOP
    properties
    end
    methods
        function y = normalize(val)
            y = val/255.0;
        end
        function y = denormalize(val)
            y = val*255;
        end
        % multiple return from stackoverflow.com/questions/4188139/matlab-multiple-return-values-from-a-function
        function [hue,sat,val] = RGBtoHSV(r,g,b)
            % formula from rapidtables.com/convert/color/rgb-to-hsv.htm
            r = normalize(r);
            g = normalize(g);
            b = normalize(b);
            Cmax = max(r,g,b);
            Cmin = min(r,g,b);
            delta = Cmax-Cmin;
            %hue
            if (Cmax==r)
                hue = 60*modp((g-b)/delta,6);
            elseif (Cmax==g)
                hue = 60*(b-r)/delta+2;
            else
                hue = 60*(r-g)/delta+4;
            end
            %saturation
            if (delta == 0)
                sat = 0;
            else
                sat = delta/Cmax;
            end
            %value
            val = Cmax;
        end
    end
end