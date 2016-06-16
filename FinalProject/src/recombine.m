function [ Children ] = recombine(p, SelectedParents)
    Children = zeros(size(SelectedParents));
    
    commonGenes = intersect(SelectedParents(1,:), SelectedParents(2,:));
    numCommonGenes = length(commonGenes);
    
    if(numCommonGenes == 0)
        posOne = randperm(p, round(p/2));
        posTwo = setdiff(1:p, posOne);
    
        Children(1, posOne) = SelectedParents(1, posOne);
        Children(1, posTwo) = SelectedParents(2, posTwo);
    
        Children(2, posOne) = SelectedParents(2, posOne);
        Children(2, posTwo) = SelectedParents(1, posTwo);
        
    else
        if numCommonGenes < p
            DifGenes = setdiff(SelectedParents, commonGenes);
            DifSize = length(DifGenes);
            
            pos1 = randperm(DifSize, round(DifSize/2));
            pos2 = setdiff(1:DifSize, pos1);
            
            Children(1, 1:(p-numCommonGenes)) = DifGenes(pos1);
            Children(2, 1:(p-numCommonGenes)) = DifGenes(pos2);
        end
        
        Children(1, (p-numCommonGenes+1):end) = commonGenes; 
        Children(2, (p-numCommonGenes+1):end) = commonGenes; 
        
    end
    Children(1, :) = Children(1, randperm(p));
    Children(2, :) = Children(2, randperm(p));
    
end