function angles = readangles(angles_char)
%M = readmatrix('Properties.xlsx','Range','B11:B12','OutputType','char');
start = true;
intchar = '';
intstr = "";
angles = [];
bracket_end = 0;
while start
    for ii = 2:length(angles_char)
        if angles_char(ii) == ']'
            for jj = 1:length(intchar)
                intstr = strcat(intstr,intchar(jj));
            end
            angles = str2double([angles, intstr]);
            intchar = '';
            intstr = "";
            bracket_end = ii;
            start = false;
        elseif angles_char(ii) == ',' %|| angles_char(ii)=='['
            for jj = 1:length(intchar)
                intstr = strcat(intstr,intchar(jj));
            end
            angles = str2double([angles, intstr]);
            intchar = '';
            intstr = "";
            continue;
        else
            intchar = [intchar,angles_char(ii)];
        end
    end
end
n = angles_char(bracket_end+1:end);
if n == 's'
    angles = [angles, angles(end:-1:1)];
elseif n == ']'
    angles = [angles];
else
    temp = [];
    for k = 1:str2double(n)
        temp = [temp, angles];
    end
    angles = temp;
end
end