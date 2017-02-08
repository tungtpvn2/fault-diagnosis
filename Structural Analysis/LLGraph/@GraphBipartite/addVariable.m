function [respAdded, id] = addVariable( this,id,alias,description, varProps)
%ADDVARIABLE Summary of this function goes here
%   Detailed explanation goes here

respAdded = false;

tempVar = Variable(id,alias,description); % Create a new variable object
tempVar.isKnown = varProps.isKnown;
tempVar.isMeasured = varProps.isMeasured;
tempVar.isInput = varProps.isInput;
tempVar.isOutput = varProps.isOutput;
tempVar.isResidual = varProps.isResidual;

this.variables(end+1) = tempVar;

respAdded = true;


end
