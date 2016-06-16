function [ SelectedParents ] = selectParents(popSize, numSelectedParents, Pop, Fitness)
    parentsCandidatesIndexes = randperm(popSize, numSelectedParents);
    ParentCandidatesFitness = Fitness(parentsCandidatesIndexes, :);
    [ParentCandidatesFitness, SelectedCandidatesIndex] = sortrows(ParentCandidatesFitness);
    
    SelectedParentsIndex = parentsCandidatesIndexes(SelectedCandidatesIndex);
    SelectedParentsIndex = SelectedParentsIndex(1:2);
    
    SelectedParents = Pop( SelectedParentsIndex , :, :);
end

