function done = mvfiles(chara,dig,prefix)
% mvfiles(chara,dig,prefix)
% Moves files in current dir whose name starts with chara to a file named with
% the characters starting in character # dig of the original name
% CHARA can be any number of characters long
% PREFIX is a string that is to be a prefix of the new filenames
% AB Jul 98/Aug 99

% Used originally with chara='0' and dig=9

le = length(chara);

d=dir;
for i=1:size(d,1),
  if length(d(i).name)>=le & d(i).name(1:le)==chara,
    newname = [prefix,d(i).name(dig:end)];
    eval(['!mv ',d(i).name,' ',newname])
  end
end
done = 1;
