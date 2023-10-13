function selectivecopy(string,newdirectory)
% SELECTIVECOPY - Copies files in current directory whose filenames end in STRING to NEWDIRECTORY
% function selectivecopy(string,newdirectory)
% AB March 02
%
% Example:
% string = 'file.mat'
% newdirectory='c:\windows\'

ls=length(string);

d=dir;
ld=length(dir);
for i=3:ld,
    fn=d(i).name;
    if isequal(fn(end-ls+1:end),string),
        newname=[newdirectory,fn];
        copyfile(fn,newname);
    end
end
