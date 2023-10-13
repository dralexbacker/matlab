function [vec1,vec3,vec4] = eliminsertions(vec1,vec2,maxfs,vec3,vec4)
% function [vec1,vec3,vec4] = eliminsertions(vec1,vec2,maxfs,vec3,vec4)
% Yields common vector eliminating insertions in vec1 or vec2
% AB Apr 2000
% Assumes that two inserts of different sizes did not happen in both vectors 
% at the same spot
% MAXFS = maximum insert size, default 20
% If VEC3 & VEC4 are included, they are chopped up in the same way that VEC1 & VEC2
% Somewhat analogous to Emacs' or Word's compare document feature

if ~exist('maxfs','var') | isempty(maxfs),
  maxfs = 20; % maximum insert size
end
if exist('vec3','var') & ~isempty(vec3) & exist('vec4','var') & ~isempty(vec4),
  ev = 1; % extra vectors true
else,
  ev = 0;
  vec3 = [];
  vec4 = [];
end

  l1 = length(vec1);
  l2 = length(vec2);
  minl = min(l1,l2);
  firstdif = min(find(vec1(1:minl)-vec2(1:minl)));
while ~isempty(firstdif),
    firstcommA = min(find(vec1(firstdif+1:minl)==vec2(firstdif)));
    firstcommB = min(find(vec1(firstdif)==vec2(firstdif+1:minl)));
   
    if ~isempty(firstcommA) | ~isempty(firstcommB),
      if isempty(firstcommB) | firstcommA<firstcommB,
        vec1 = vec1([1:firstdif-1,firstdif+firstcommA:end]);
if ev,        vec3 = vec3([1:firstdif-1,firstdif+firstcommA:end]); end
      elseif isempty(firstcommA) | firstcommA>firstcommB,
        vec2 = vec2([1:firstdif-1,firstdif+firstcommB:end]);
if ev,        vec4 = vec4([1:firstdif-1,firstdif+firstcommB:end]); end
      else,
        vec1 = vec1([1:firstdif-1,firstdif+firstcommA:end]);
        vec2 = vec2([1:firstdif-1,firstdif+firstcommB:end]);
if ev,
        vec3 = vec3([1:firstdif-1,firstdif+firstcommA:end]);
        vec4 = vec4([1:firstdif-1,firstdif+firstcommB:end]);
end
      end
    else, %
        vec1 = vec1(1:firstdif-1);
        vec2 = vec2(1:firstdif-1);
if ev,
        vec3 = vec3(1:firstdif-1);
        vec4 = vec4(1:firstdif-1);
end
    end
  l1 = length(vec1);
  l2 = length(vec2);
  minl = min(l1,l2);
  firstdif = min(find(vec1(1:minl)-vec2(1:minl)));
end

if ~isequal(vec1,vec2),
  error('ELIMINSERTIONS is not working')
end

