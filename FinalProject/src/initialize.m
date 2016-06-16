function [ Pop ] = initialize( numObs, p, popSize )
    Pop = zeros(popSize, p);
    for i = 1:popSize
        Pop(i,:) = randperm(numObs, p);
    end 
end

