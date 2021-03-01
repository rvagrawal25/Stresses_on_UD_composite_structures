function sub_angles = read_sub_angles(angles_char)
start = true;
intchar = '';
intstr = "";
sub_angles = [];
bracket_end = 0;
while start
    for ii = 1:length(angles_char)
        if angles_char(ii) == ')'
            for jj = 1:length(intchar)
                intstr = strcat(intstr,intchar(jj));
            end
            sub_angles = [sub_angles, str2double(intstr)];
            intchar = '';
            intstr = "";
            bracket_end = ii;
            start = false;
            break
        elseif angles_char(ii) == ',' %|| angles_char(ii)=='['
            for jj = 1:length(intchar)
                intstr = strcat(intstr,intchar(jj));
            end
            sub_angles = [sub_angles, str2double(intstr)];
            intchar = '';
            intstr = "";
            continue;
        elseif angles_char(ii) == '('
            sub_char_vector = angles_char(ii+1);
            sub_angles = [sub_angles, read_sub_angles(sub_char_vector)];
        else
            intchar = [intchar,angles_char(ii)];
        end
    end
end
n = angles_char(bracket_end+1:end);
if n == 's'
    sub_angles = [sub_angles, sub_angles(end:-1:1)];
elseif n == ')'
    sub_angles = [sub_angles];
else
    temp = [];
    for k = 1:str2double(n)
        temp = [temp, sub_angles];
    end
    sub_angles = temp;
end
end