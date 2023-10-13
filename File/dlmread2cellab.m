function celda=dlmreadab(filename, dlm, r, c, rng)
%DLMREAD2CELLAB Read ASCII delimited file. All data (including numeric) returned in CELDA.
% Works, tested 110406
%   [M, CELDA] = DLMREAD(FILENAME,DLM) reads the data from the ASCII delimited
%   file FILENAME using the delimiter DLM.  The result is returned in M.
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
%   See also DLMREAD, DLMREADAB, DLMWRITE, WK1READ, WK1WRITE.

%   Brian M. Bourgault 10/22/93
%   Copyright (c) 1984-98 by The MathWorks, Inc.
%   $Revision: 5.18 $  $Date: 1997/11/21 23:35:05 $


% test for proper filename
if nargin<1, error('Not enough input arguments.'); end
if ~isstr(filename), error('Filename must be a string.'); end

NEWLINE = sprintf('\n');

% check/set row,col offsets
if nargin<3, r = 0; end
if nargin<4, c = 0; end

% delimiter defaults to Comma for CSV
if nargin<2, dlm = ','; end
dlm = sprintf(dlm); % Handles special characters.

% get the upper-left and bottom-right cells of the range to read into MATLAB
if nargin==5
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
line = fgets(fid); % get the 1st line, if any...

% read till eof
while ~isequal(line,-1)
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
        if(all | ((loc >= ulc) & (loc <= brc)))
            if ~isempty(num) & loc(2)>r
%                       celda{loc(2)-r+1, loc(1)+c} = setstr(num);
                       celda{loc(2)-r, loc(1)+c} = setstr(num);
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
    % get next line of filea
    line = fgets(fid); 
end
% close file
fclose(fid);

