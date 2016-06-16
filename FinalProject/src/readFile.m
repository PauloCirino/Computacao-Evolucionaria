function [ numObs, p, Data ] = readFile( fileName )
    Data = load(fileName);
    numObs = Data(1,1);
    p = Data(1,2);
    Data = Data(2:(numObs+1),:);
end

