import ballerinax/trigger.github;

listener github:Listener githubListener = new ();

service github:IssuesService on githubListener {
    remote function onOpened(github:IssuesEvent payload) returns error|() {
        do {
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    remote function onClosed(github:IssuesEvent payload) returns error|() {
        do {
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    remote function onReopened(github:IssuesEvent payload) returns error|() {
        do {
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    remote function onAssigned(github:IssuesEvent payload) returns error|() {
        do {
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    remote function onUnassigned(github:IssuesEvent payload) returns error|() {
        do {
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    remote function onLabeled(github:IssuesEvent payload) returns error|() {
        do {
            github:Label? label = payload.label;
            if label is github:Label {
                string labelName = label.name;
                int? labelIndex = triggerLabels.indexOf(labelName);
                if labelIndex is int {
                    // Label exists in triggerLabels - create Salesforce case
                    github:Issue issue = payload.issue;
                    string issueTitle = issue.title;
                    string? issueBody = issue.body;
                    string issueDescription = issueBody is string ? issueBody : "";

                    SalesforceCase salesforceCase = {
                        Subject: issueTitle,
                        Description: issueDescription,
                        Status: caseStatus,
                        Priority: casePriority,
                        RecordTypeId: caseRecordType,
                        OwnerId: caseOwnerId
                    };

                    _ = check salesforceClient->create(sObjectName = "Case", sObject = salesforceCase);
                }
            }
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

    remote function onUnlabeled(github:IssuesEvent payload) returns error|() {
        do {
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
