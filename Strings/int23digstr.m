function string = int23digstr(xa)
% function string = int23digstr(int)
% Converts integer INT into a STRING of 3 digits with leading zeros if necess.
% AB Nov 99

    if xa<10,
       z='00';
       elseif xa<100,
       z='0';
       else
       z='';
    end;
  string=[z int2str(xa)];	
