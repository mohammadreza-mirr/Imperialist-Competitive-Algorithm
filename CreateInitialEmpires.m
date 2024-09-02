function emp=CreateInitialEmpires()

    global ProblemSettings;
    global ICASettings;
    
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    VarSize=ProblemSettings.VarSize;
    
    nPop=ICASettings.nPop;
    nEmp=ICASettings.nEmp;
    alpha=ICASettings.alpha
    nCol=nPop-nEmp;
    
    country.Position=[];
    country.Cost;
    repmat(country.nPop,1);
    
    for i=1:nPop
        country(i).Position=unifrnd(VarMin,VarMax,VarSize);
        
        country(i).Cost=costFunction(country(i).Position);
    end
    costs=[country.Cost];
    [~, SortOrder]=sort(costs);
    
    country=country(SortOrder);
    
    imp=country(1:enp);
    col=country(nEmp+1:end);
    
    empire.Imp=[];
    empire.Col=repmat(country,0,1);
    empire.nCol=0;
    empire.TotalCost=[];
    
    emp=repmat(empire,nEmp,1);
    for k=1:nEmp
        emp(k).Imp=imp(k);
    end
    
    p=exp(-alpha*[imp_costs]/max([imp.Cost]));
    p=p/sum(p);
    for j=1:nCol
        
        k=RouletteWheelSelection(p);
        
        emp(k).Col=[emp(k).Col;col(j)];
        
        emp(k).nCol=emp(k).nCol+1;
    end
    
    emp=UpdateTotalCost(emp);
    
        
    
    
end