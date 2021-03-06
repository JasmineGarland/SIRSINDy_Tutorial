function yout = poolDataSeasonal(t, yin, nVars, polyorder, usesine, useConstant, omega, B, Bir)

% Set default values
if nargin < 9 || isempty( Bir )
    Bir = 0.;
end
if nargin < 8 || isempty( B)
    B = cos(2*pi*t/(omega) + pi);
end
if nargin < 7 || isempty( omega )
    omega = 1;
end
if nargin < 6 || isempty( useConstant )
    useConstant = 1;
end

n = size(yin,1);
ind = 1;
% poly order 0
if useConstant == 1
    yout(:,ind) = ones(n,1);
    ind = ind+1;
end

if Bir ~= 0.
    yout(:, ind) = Bir;
    ind = ind+1;
end

% poly order 1
for i=1:nVars
    yout(:,ind) = yin(:,i);
    ind = ind+1;
end

if(polyorder>=2)
    % poly order 2
    for i=1:nVars
        for j=i:nVars
            yout(:,ind) = yin(:,i).*yin(:,j);
            ind = ind+1;
        end
    end
end

if(polyorder>=3)
    % poly order 3
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                yout(:,ind) = yin(:,i).*yin(:,j).*yin(:,k);
                ind = ind+1;
            end
        end
    end
end

if(polyorder>=4)
    % poly order 4
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                for l=k:nVars
                    yout(:,ind) = yin(:,i).*yin(:,j).*yin(:,k).*yin(:,l);
                    ind = ind+1;
                end
            end
        end
    end
end

if(polyorder>=5)
    % poly order 5
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                for l=k:nVars
                    for m=l:nVars
                        yout(:,ind) = yin(:,i).*yin(:,j).*yin(:,k).*yin(:,l).*yin(:,m);
                        ind = ind+1;
                    end
                end
            end
        end
    end
end

if(usesine)
    for k=1:3;
        yout = [yout sin(k*yin) cos(k*yin)];
    end
end


%Tacks on second copy, multiplied by B
[rw, cl] = size(yout);
youtB = zeros(rw, cl);
for i = 1:cl
    youtB(:, i) = B.*yout(:, i);
end
yout = horzcat(yout, youtB);


