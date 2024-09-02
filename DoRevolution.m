function emp=DoRevolution(emp)
   
   
    global ProblemSettings;
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarSize=ProblemSettings.VarSize;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    VarSize=ProblemSettings.VarSize;
    
    global ICASettings;
    pRevolution=ICASettings.pRevolution;
    mu=ICASettings.mu;
    
    nmu=ceil(mu*nVar);
    sigma=0.1*(VarMax*VarMin);
     nEmp=numel(emp);
    
    for k=1:nEmp
        
        jj=randsample(nVar,mu)';
        NewPos=emp(k).Imp.Position+sigma*randn(VarSize);
        NewImpPos=emp(k).Imp.Position;
        NewImpPos(jj)NewPos(jj);
        NewImpCost=CostFunction(NewImpPos);
        if NewImpCost<emp(k).Imp.Cost
            emp(k).Imp.Position=NewImpPos;
            emp(k).Imp.Cost=NewImpCost;
        end
        
        
        for i=1:emp(k).nCol
            
            if rand<=pRevolution
                jj=randsample(nVar,mu)';
                NewPos=emp(k).Col(i).Position+sigma*randn(VarSize);
                
            emp(k).Col(i).Position=NewPos(jj);
                
            
            emp(k).Col(i).Position=max(emp(k).Col(i).Position,VarMin);
            emp(k).Col(i).Position=min(emp(k).Col(i).Position,VarMax);
            
            emp(k).Col(i).Cost=CostFunction(emp(k).Col(i).Position);
            end
end