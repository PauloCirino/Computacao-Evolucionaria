function [ Children ] = mutate(Children, mutationRate, numObs)
    Size = size(Children);
    
    for i = 1:Size(1)
        possibleNewGenes = setdiff(1:numObs, Children(i, :));
        numNewPossibleGenes = length(possibleNewGenes);
        for j = 1:Size(2)
            if rand < mutationRate
                newGene = possibleNewGenes(randperm(numNewPossibleGenes, 1));
                mutatedGene = newGene;
                
                possibleNewGenes = setdiff(possibleNewGenes, newGene);
                numNewPossibleGenes = numNewPossibleGenes - 1;
                
                Children(i, j) = mutatedGene;
            end
        end
    end
end

