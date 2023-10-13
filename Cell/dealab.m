function varargout=dealab(varargin)

nout=nargout;
varargout=cell(1,nout);
varargout(1:length(varargin))=varargin;
varargout(length(varargin)+1:nout)=[];
    