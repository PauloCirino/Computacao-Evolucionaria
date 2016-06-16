function [NewPop, NewFitness] = selectNextGen(Pop, Fitness, Children, ChildrenFitness, elit)
    NewPop = vertcat(Pop, Children);
    NewFitness = vertcat(Fitness, ChildrenFitness);
    
    [NewFitness, orderedPos] = sort(NewFitness);
    NewPop = NewPop(orderedPos, :);

    popSize = length(Fitness);
    newPopSize = length(NewFitness);
    
    elitSize = round(elit * popSize);
    elitPos = 1:elitSize;
    randomSolutionsPos = (elitSize+1:newPopSize);
    randomSolutionsPos = randomSolutionsPos(randperm(newPopSize - elitSize, popSize - elitSize));
    Pos = [elitPos, randomSolutionsPos];
    
    NewPop = NewPop(Pos, :);
    NewFitness = NewFitness(Pos);
    
    
    
    
end

