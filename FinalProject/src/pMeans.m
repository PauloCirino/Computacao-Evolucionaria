function [ BestSolution, BestFitness, AvgFitness] = pMeans(fileName, popSize, numRepredutionsPerGen, numSelectedParents, mutationRate, elit, maxIterations, seed)
    
    rng(seed);
    [numObs, p, Data] = readFile(fileName);

    Pop = initialize(numObs, p, popSize);
    Fitness = evaluate(Pop, Data);

    BestSolution = Inf(maxIterations, p);
    BestFitness = Inf(maxIterations, 1);
    AvgFitness = Inf(maxIterations, 1);

    LastBestFitness = 0;

    for iter = 1:maxIterations
        Children = zeros(2 * numRepredutionsPerGen, p);
        for i = 1:numRepredutionsPerGen
            SelectedParents = selectParents(popSize, numSelectedParents, Pop, Fitness);
            Children(2*i-1:2*i, :) = recombine(p, SelectedParents);
            Children = mutate(Children, mutationRate, numObs);
        end

        ChildrenFitness = evaluate(Children, Data);

        [Pop, Fitness] = selectNextGen(Pop, Fitness, Children, ChildrenFitness, elit);

        BestSolution(iter, :) = Pop(1, :);
        BestFitness(iter) = Fitness(1);
        AvgFitness(iter) = mean(Fitness);

        if LastBestFitness ~= Fitness(1)
            Msg = sprintf('Iter = %d \n Best Fitness = %d \n\n', iter, Fitness(1));
            disp(Msg);
        end

%         scatter(Data(:, 1), Data(:, 2));
%         hold on;
%         BestPoints = Data(BestSolution(iter, :),:);
%         scatter(BestPoints(:, 1), BestPoints(:, 2));
%         hold off;
% 
        LastBestFitness = Fitness(1);
    end


    figure
    Iter = 1:maxIterations;
    plot(Iter, BestFitness, Iter, AvgFitness);
    
    figure
    scatter(Data(:, 1), Data(:, 2));
    hold on;
    BestPoints = Data(BestSolution(maxIterations, :),:);
    scatter(BestPoints(:, 1), BestPoints(:, 2));
    hold off
end