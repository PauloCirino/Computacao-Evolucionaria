%clear;
%close all;
%clc;

function [] = KnapSackProblem(NumParents, MaxNumIterations, CrossOverProb, BitFlipProb) 

    %Definição do Problema
    BagSize = 35;
    NumObjects = 8;
    Weight = [10, 18, 12, 14, 13, 11, 8, 6];
    Value = [5, 8, 7, 6, 9, 5, 4, 3];
    Objects = [ Weight;
                Value ];

    %Parametros Evolucionarios
    %NumParents = 20;
    %MaxNumIterations = 1500;
    %CrossOverProb = 0.8;
    %BitFlipProb = 0.05;

    %Inicializaçao das Solucoes
    Pais = randi([0 1], NumParents,NumObjects);
    Aptitude = zeros(NumParents, 1);

    for i = 1:NumParents

        Aptitude(i) = fitness_ksp(Pais(i,:), Value, Weight, BagSize);

    end

    BestResult = zeros(MaxNumIterations, 1);
    AvarageResult = zeros(MaxNumIterations, 1);

    for iter = 1:MaxNumIterations

        BestResult(iter) = max(Aptitude);
        AvarageResult(iter) = mean(Aptitude);


        %%Parent Selection
        TotalAptitude = sum(Aptitude);
        NewParentsGroup = zeros(NumParents, 2, NumObjects);
        for i = 1:NumParents
            for j = 1:2

                Roulet = Aptitude / TotalAptitude;
                [SortedRoulet, Order] = sort(Roulet);
                CutPoint = rand();
                
                pos = 0;
                val = 0;
                while val < CutPoint
                    
                    pos = pos+1;
                    val = val + SortedRoulet(pos);
                    
                end
                
                NewParentsGroup(i, j, :) = Pais(Order(pos),:);
                
            end
        end

        %%CrossOver 
        NewChildren =  zeros(NumParents,NumObjects);
        for j = 1:NumParents
            NewParents = reshape(NewParentsGroup(j, : , :), [2, NumObjects]);
            if(rand() < CrossOverProb)

                CrossOverPos = randperm(NumObjects);
                CrossOverPos = CrossOverPos(1);

                if(rand() > 0.5)

                    NewChildren(j, 1:CrossOverPos) = NewParents(1, 1:CrossOverPos); 
                    NewChildren(j, CrossOverPos:end) = NewParents(2, CrossOverPos:end); 

                else

                    NewChildren(j, 1:CrossOverPos) = NewParents(2, 1:CrossOverPos); 
                    NewChildren(j, CrossOverPos:end) = NewParents(1, CrossOverPos:end); 

                end


            else
               if(rand() > 0.5)
                   NewChildren(j, : ) = NewParents(1,:); 

               else
                   NewChildren(j, : ) = NewParents(2,:);    
               end
            end
        end


        %%Mutation
        %%Passa por todas as posiçoes e faz o bit flip com divida probabilidade
        for j = 1:NumParents
           for k = 1:NumObjects
                if(rand() < BitFlipProb)
                   if(NewChildren(j,k) == 1)
                       NewChildren(j,k) = 0;
                   else
                       NewChildren(j,k) = 1;
                   end
                end
           end
        end


        %Survivals Selection
        %%Os novos filhos agora sao do tamanho dos pais, por isso os
        %%sobreviventes sao todos os filhos
        Pais = NewChildren;
        for i = 1:NumParents

            Aptitude(i) = fitness_ksp(Pais(i,:), Value, Weight, BagSize);

        end

    end 

    iteration = 1:MaxNumIterations;
    plot(iteration, BestResult, iteration, AvarageResult);
    titleSstring = sprintf('KnapSack Problem');
    title(titleSstring);
    xlabel('Iterations');
    ylabel('Fitness');
    legend('Best Fitness','Average Fitness')
end

%%% Testing Problems
    %Parametros Evolucionarios
    %NumParents = 20;
    %MaxNumIterations = 1500;
    %CrossOverProb = 0.8;
    %BitFlipProb = 0.05;
    