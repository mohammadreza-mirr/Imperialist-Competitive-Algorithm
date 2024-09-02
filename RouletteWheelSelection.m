function i=RouletteWheelSelection(p)
   r=rand;
   
   C=cumsum(p);
   i=find(r<=C,1,'first');

   
end