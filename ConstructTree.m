function [ ] = ConstructTree( S, k )
%CONSTRUCTTREE Summary of this function goes here
%   Detailed explanation goes here

    numNeg = CountNeg(S);
    numPos = CountPos(S);
    if(numNeg == 0 || numPos == 0)
        if(numNeg > 0)
            tree{k} = 'no';
            k = k + 1;
        elseif(numPos > 0)
            tree{k} = 'yes';
            k = k + 1;
        end
    else
        nodeIndex = MaxInfGainNode(S);
        tree{k} = S{nodeIndex};
        k = k + 1;
        for i = 1:sizeof(S{nodeIndex})
            S_ = newS(S);
            ConstructTree(S_, k);
        end
    end
end

