function Nlines=countlinesoftextfile(filename)
%COUNTlinesOFTEXTFILE Count lines of ASCII delimited file starting at line STARTLINE and ending at ENDLINE or EOF. 
% Adapted from READLINESOFTEXTFILE
% AB Jun 01

% test for proper filename
if nargin<1, error('Not enough input arguments.'); end
if ~isstr(filename), error('Filename must be a string.'); end

% open the file 
fid = fopen(filename,'r');
if fid == (-1)
    error(['dlmread: Could not open file filename ']);
end

% Read delimited format 
line = fgets(fid); % get the 1st line, if any...
lineN=0;
while ~isequal(line,-1),
    lineN=lineN+1;
    line = fgets(fid); % get the 1st line, if any...
end
Nlines=lineN;

fclose(fid);
