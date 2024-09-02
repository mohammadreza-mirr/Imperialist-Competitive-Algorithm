function emp=UpdateToatalCost(emp)

    global ICASettings;
    zeta=ICASettings.zeta;
    nEmp=numel(emp);
    
    for k=1:nEmp
       emp(k).TotalCost= emp(k).Imp.Cost+zeta*mean([emp(k).Col.Cost]);
    end
