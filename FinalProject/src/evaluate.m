function [ Fitness ] = evaluate( Pop, Data )
    numObs = length(Data);
    
    popDim = size(Pop);
    popSize = popDim(1);
    p = popDim(2);
    
    Fitness = Inf(popSize,1);
    for i = 1:popSize 
        obsFitness = Inf(numObs,1);
        for j = 1:numObs
           for k = 1:p
                dist = getDist(Data(Pop(i, k,:), :), Data(j, :));
                if dist < obsFitness(j)
                    obsFitness(j) = dist;
                end
           end
        end
        Fitness(i) = sum(obsFitness);
    end
end

function DIST = getDist (x1, x2)
    x1 = x1(:);
    x2 = x2(:);
    DIST = sqrt(sum((x1 - x2) .* (x1 - x2)));
end
