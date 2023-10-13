function [m,celda,goodrows]=readlinesoftextfile(filename, startline, endline,dlm, r, c, rng)
%READlinesOFTEXTFILE Read lines of ASCII delimited file starting at line STARTLINE and ending at ENDLINE or EOF. 
% Numeric data returned in M, rest returned in CELDA.
% Alex Backer Jun 01
% Adapted from DLMREADAB
%   [m,celda,goodrows]=readlinesoftextfile(filename, startline, endline,dlm, r, c, rng)
%   Use '\t' to specify a tab. 
%
%   [M, CELDA] = DLMREAD(FILENAME,DLM,R,C) reads data from the DLM-delimited
%   file format FILENAME.  R and C specify the row R and column C
%   where the upper-left corner of the data lies in the file.  R and C
%   are zero-based so that R=0 and C=0 specifies the first value in the file.
%
%   [M, CELDA] = DLMREAD(FILENAME,DLM,R,C,RNG) reads only the range specified
%   by RNG = [R1 C1 R2 C2] where (R1,C1) is the upper-left corner of
%   the data to be read and (R2,C2) is the lower-right corner.  RNG
%   can also be specified using spreadsheet notation as in RNG = 'A1..B7'.
%
%   See also DLMREAD, DLMWRITE, WK1READ, WK1WRITE.

ELIMROWSWERR=0; % If use 1
goodrows=[];

% test for proper filename
if nargin<1, error('Not enough input arguments.'); end
if ~isstr(filename), error('Filename must be a string.'); end
if ~exist('startline','var') | isempty(startline),
    startline=1;
end
NEWLINE = sprintf('\n');
badrows=[]; % rows to delete xq contained some column with something that is more than one number

% check/set row,col offsets
if nargin<5, r = 0; end
if nargin<6, c = 0; end

% delimiter defaults to Comma for CSV
if nargin<4, dlm = ','; end
dlm = sprintf(dlm); % Handles special characters.

% get the upper-left and bottom-right cells of the range to read into MATLAB
if nargin==7
    if ~isstr(rng)
        ulc = rng(1:2);
        brc = rng(3:4);
    else
        x = str2rng(rng);
        ulc = x(1:2);
        brc = x(3:4);
    end
    all = 0;
else
    all = 1;
    rng = [ 0 0 ];
    ulc = [0 0];
    brc = [0 0];
end

ulc = fliplr(ulc+1);
brc = fliplr(brc+1);

% open the file 
fid = fopen(filename,'r');
if fid == (-1)
    error(['dlmread: Could not open file filename ']);
end

% Read delimited format 
eol = NEWLINE;    % End Of Line char
loc = [1 1];      % starting location of return matrix
line=0;
lineN=0;
while lineN<startline & ~isequal(line,-1),
    lineN=lineN+1;
    line = fgets(fid); % get the 1st line, if any...
end

% read till eof or maxNlines reached
while ~isequal(line,-1) & lineN<=endline,
    i = 1;
    j = 1;
    while i <= length(line)
        %
        % read chars from line, parsing delimiters & numbers
        %
        num = [];
        j = 1;

        while (i <= length(line)) & (line(i) ~= dlm) & (line(i) ~= eol)
            % build number string from characters on the line
            num(j) = line(i);
            i = i + 1;    % overall line index
            j = j + 1;    % number string index
        end

        % found a delimiter or <eol>
        if(all  |  ((loc >= ulc) & (loc <= brc))) % ulc=upper left corner of range to read, brc = bottom right, loc=location of return matrix
            if ~isempty(num)
                v=str2num(setstr(num));
                if ~isempty(v),
                    if length(v)==1,
                        m(loc(2)+r, loc(1)+c) = v;
                    else,
                        m(loc(2)+r, loc(1)+c) = NaN;
                        badrows=[badrows,loc(2)+r];
                    end
                else % try a char
                    %if length(setstr(num))==1,
                    %   m(loc(2)+r, loc(1)+c) = setstr(num);
                    %else, % column's input is a multicharacter string
                       celda{loc(2)+r, loc(1)+c} = setstr(num);
                    %end
                end
            else     
                % no number found between delimiters
                m(loc(2)+r, loc(1)+c) = NaN;
            end
        end

        if (i <= length(line)) & (line(i) == dlm)
            % delimiter, set location to next row and get next line 
            loc(1) = loc(1) + 1;
            i = i + 1;
        else
            if (i > length(line)) | (line(i) == eol)
                % eol, set location to next row and get next line
                loc(2) = loc(2) + 1;
                loc(1) = 1;
                i = i + 1;
            end
        end
    end
    % get next line of file
    lineN=lineN+1;
    line = fgets(fid); 
end
% close file
fclose(fid);

% Return only the valid part
if exist('m'),
   m = m(2*r+1:end,2*c+1:end);
else,
   m = [];
end

if ELIMROWSWERR & ~isempty(badrows),
    goodrows=exclude(1:size(m,1),badrows);
    m=m(goodrows,:);
    if ~isempty(celda),
        celda=celda(goodrows,:);
    end
end

