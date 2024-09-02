clc;
clear;
close all;

%% Problem Definition

CostFunction=@(x) Sphere(x);

nVar=5;
VarSize=[1 nVar];
VarMin=-10;
VarMax=10;

global ProblemSettings;
ProblemSettings.CostFunction=CostFunction;
ProblemSettings.nVar;
ProblemSettings.VarMin;
ProblemSettings.VarMax;

%% ICA Parameters

MaxIt=100;

nPop=50;
nEmp=10;

alpha=1;
beta=2;

pRevolution=0.1;
mu=0.05;

zeta=0.1;


ShareSettings;


%% Initialization

emp=CreateInitialEmpires();

BestCost=zeros(MaxIt,1);


%% ICA Main Loop

for it=1:MaxIt
    
    emp=AssimilateColonies(emp);
    
    emp=DoRevolution(emp);
    
    emp=IntraEmpireCompetition(emp);
    
    emp=UpdateToatalCost(emp);
    
    emp=InterEmpireCompetition(emp);
    
    imp=[emp.Imp];
    [~,bestImpIndex]=min([imp.Cost]);
    BestSol=imp(BestImpIndex);
    
    BestCost(it)=BestSol.Cost;
    
    disp(['Iteration ' num2str(it) ':BestCost= ' num2str(BestCost(it))]);
    
end

%% Results

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('BestCost');
    
    
    
    
    

