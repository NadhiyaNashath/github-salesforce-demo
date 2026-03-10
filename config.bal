// GitHub repository configurations
configurable string[] githubRepositories = ?;

// Configurable list of labels that trigger the workflow
configurable string[] triggerLabels = ?;

// Salesforce connection configurations
configurable string salesforceBaseUrl = ?;
configurable string salesforceAccessToken = ?;

// Salesforce case configurations
configurable string caseRecordType = "";
configurable string casePriority = "Medium";
configurable string caseStatus = "New";
configurable string caseOwnerId = ?;

// Error handling configurations
configurable int retryCount = 3;
configurable string errorNotificationEmail = ?;
