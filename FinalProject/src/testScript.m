clear()
fileName324 = '../testData/pmedian324.txt';
fileName818 = '../testData/pmedian818.txt';
fileName3282 = '../testData/pmedian3282.txt';



fileName = fileName324;

%General Parameters
seed = 130594;
popSize = 10;
maxIterations = 200;
numRepredutionsPerGen = round(0.5 * popSize) + 1;

%Selection Parameters
numSelectedParents = round(0.1 * popSize) + 2;

%Mutation Parameters
mutationRate = 0.2;

%Survivors Chosing Parameters
elit = 0.5;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   TEST NUM 1 
disp('BEGIN TEST 1');
[ ThisBestSolution, ThisBestFitness, ThisAvgFitness] = pMeans(fileName, popSize, numRepredutionsPerGen, numSelectedParents, mutationRate, elit, maxIterations, seed);

testNum = 1;
BestSol(testNum,:) = ThisBestSolution(end, :);
BestFitness(testNum) = ThisBestFitness(end);
AvgFitness(testNum) = ThisAvgFitness(end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   TEST NUM 2 
% disp('BEGIN TEST 2');
% popSize = 50;
% [ ThisBestSolution, ThisBestFitness, ThisAvgFitness] = pMeans(fileName, popSize, numRepredutionsPerGen, numSelectedParents, mutationRate, elit, maxIterations, seed);
% 
% testNum = 2;
% BestSol(testNum,:) = ThisBestSolution(end, :);
% BestFitness(testNum) = ThisBestFitness(end);
% AvgFitness(testNum) = ThisAvgFitness(end);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   TEST NUM 3
% disp('BEGIN TEST 3');
% popSize = 25;
% [ ThisBestSolution, ThisBestFitness, ThisAvgFitness] = pMeans(fileName, popSize, numRepredutionsPerGen, numSelectedParents, mutationRate, elit, maxIterations, seed);
% 
% testNum = 3;
% BestSol(testNum,:) = ThisBestSolution(end, :);
% BestFitness(testNum) = ThisBestFitness(end);
% AvgFitness(testNum) = ThisAvgFitness(end);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   TEST NUM 4
disp('BEGIN TEST 4');
popSize = 15;
[ ThisBestSolution, ThisBestFitness, ThisAvgFitness] = pMeans(fileName, popSize, numRepredutionsPerGen, numSelectedParents, mutationRate, elit, maxIterations, seed);

testNum = 4;
BestSol(testNum,:) = ThisBestSolution(end, :);
BestFitness(testNum) = ThisBestFitness(end);
AvgFitness(testNum) = ThisAvgFitness(end);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %   TEST NUM 5
% disp('BEGIN TEST 5');
% popSize = 5;
% [ ThisBestSolution, ThisBestFitness, ThisAvgFitness] = pMeans(fileName, popSize, numRepredutionsPerGen, numSelectedParents, mutationRate, elit, maxIterations, seed);
% 
% testNum = 5;
% BestSol(testNum,:) = ThisBestSolution(end, :);
% BestFitness(testNum) = ThisBestFitness(end);
% AvgFitness(testNum) = ThisAvgFitness(end);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp(BestSol);
disp(BestFitness);
disp(AvgFitness);