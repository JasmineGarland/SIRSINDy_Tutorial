function [yout,newout] = poolDataSeasonalLIST(yin,ahat,nVars,polyorder)
%{'S','I'},Xi,n,polyorder,usesine, useConstant, useBirth

usesine = 0;
useConstant = 1;, 
useBirth = 0;

n = size(yin,1);

ind = 1;
% poly order 0
yout{ind,1} = ['1'];
ind = ind+1;

% poly order 1
for i=1:nVars
    yout(ind,1) = yin(i);
    ind = ind+1;
end

if(polyorder>=2)
    % poly order 2
    for i=1:nVars
        for j=i:nVars
            yout{ind,1} = [yin{i},yin{j}];
            ind = ind+1;
        end
    end
end

if(polyorder>=3)
    % poly order 3
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                yout{ind,1} = [yin{i},yin{j},yin{k}];
                ind = ind+1;
            end
        end
    end
end

%Tacks on second copy, multiplied by B
[rw, ~] = size(yout);
ind = 1;
youtB{1,1} = ['B','1'];
for i = 1:rw
    youtB{ind,1} = ['B', yout{i}];% B.*yout(:, i);
    ind = ind + 1;
end
yout = vertcat(yout, youtB);

output = yout;
newout(1) = {''};
% label columns
for k=1:length(yin)
    newout{1,1+k} = [yin{k},'dot'];
end

for k=1:size(ahat,1)
    newout(k+1,1) = output(k);
    for j=1:length(yin)
        newout{k+1,1+j} = ahat(k,j);
    end
end
newout;