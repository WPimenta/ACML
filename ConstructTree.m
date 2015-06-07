function [ node ] = ConstructTree( S )
%CONSTRUCTTREE Summary of this function goes here
%   Detailed explanation goes here

    [numNeg, numPos] = countNegPos();
    if(numNeg == 0 || numPos == 0)
        if(numNeg > 0)
            node = 'no';
        elseif(numPos > 0)
            node = 'yes';
        end
    else
        nodeIndex = MaxInfGainNode(S);
        node = S{nodeIndex};
        for i = 1:sizeof(S{nodeIndex})
            S_ = newS(S);
            ConstructTree(S_);
        end
    end
end

