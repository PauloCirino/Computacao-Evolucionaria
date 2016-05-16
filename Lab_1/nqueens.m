%% ELE083 - Computação Evolucionária
% Universidade Federal de Minas Gerais
% ------------------------------------------------------------------------
% Primeiro Laboratório de Computação Evolucionária
% Problema:
% Aplicação de algoritmo genético para resolução do problema das N-Rainhas
% ------------------------------------------------------------------------
% Alunos: Bruno Sampaio Camba e Paulo Cirino Ribeiro
% ------------------------------------------------------------------------
%% Start -----------------------------------------------------------------
clear;
close all;
clc;
%% Parameters
popSize = 200;
genes = 30; %Number of Queens
crossoverRate = 1.0;
mutationRate = 0.8;
maxIterations = 100000;

%% STEP 1 - Initialise population with random candidate solutions
%Population with an additional column for fitness
pop = zeros(popSize,genes+1);

for i=1:popSize
    pop(i,1:genes) = randperm(genes);
    % STEP 2 - Evaluate each candidate solution
    pop(i,genes+1) = fitness_nq(pop(i,1:genes));
end

%Sort population based on fitness so that best candidate is the first one
pop = sortrows(pop,genes+1);
bestFitness = pop(1,genes+1);
averageFitness = mean(pop(:,genes+1));
%% While termination condition is NOT satisfied, do:
iteration = 1;

while(bestFitness(iteration) ~= 0 && iteration <= maxIterations)

    % STEP 3 - Select Parents - Best 2 out of random 5
    parentsIndex = randperm(popSize,5);
    parents = sortrows(pop(parentsIndex,:),genes+1);
    selectedParents = parents(1:2,1:genes);
    
    % STEP 4 - Recombine pais of parents
    offspring = CutAndCrossfill_Crossover(selectedParents);
    
    % STEP 5 - Mutate the resulting offspring - Change two columns
    for i=1:2
        if rand < mutationRate
            swapCol = randperm(genes,2);
            offspring(i,fliplr(swapCol)) = offspring(i,swapCol);
        end    
    end
    
    % STEP 6 - Evaluate new candidates
    for i=1:2
        offspring(i,genes+1) = fitness_nq(offspring);
    end
    
    % STEP 7 - Select individuals for the next generation
    pop = [pop; offspring];
    pop = sortrows(pop,genes+1);
    pop = pop(1:popSize,:);
    
    bestFitness(iteration+1) = pop(1,genes+1);
    averageFitness(iteration+1) = mean(pop(:,genes+1));
    iteration = iteration + 1;
end

%% Plot Best Fitness x Iteration and Average Fitness x Iteration
iteration = 1:iteration;
plot(iteration, bestFitness, iteration, averageFitness);
titleSstring = sprintf('%d-Queens Problem',genes);
title(titleSstring);
xlabel('Iterations');
ylabel('Fitness');
legend('Best Fitness','Average Fitness')
%% END