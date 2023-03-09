% Create Test Report 

% First clear and then load the test manager with the customer file
sltest.testmanager.clear
exampleCustomerFile = '~/Desktop/WTUR1_DyCtl_TestResults_StorageIssues.mldatx';
disp("111\n");
sltest.testmanager.importResults(exampleCustomerFile);
%% get results and create report
disp("222\n");

result_sets = sltest.testmanager.getResultSets();

fprintf('### Write Results to PDF-file\n');

PdfReportTimeout = 3600; % timeout for pdf report creation in seconds

% Timer to throw a timeout, which closes the script with error code 1
t = timer('StartDelay', PdfReportTimeout, 'TimerFcn', ' fprintf(''### PDF-Report creation timeout.''); quit(1,''force'')'); %, 'StopFcn', 'delete(t)');

start(t) % timer start
disp("333\n");
sltest.testmanager.report(result_sets, '~/Desktop/TestResults111.pdf', 'Title', 'testTitle111', 'IncludeSimulationSignalPlots', false, 'LaunchReport', false, 'IncludeTestResults', 0);
fprintf('### PDF-Report created\n');
disp("444\n");
stop(t); % timer stop if no time violation appeard 
delete(t); % delete timer object
