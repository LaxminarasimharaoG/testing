package Model;

import java.util.Date;

public class CaseDetails {
    
    private int caseId;
    
    private String caseName;
    
    private CaseType caseTypeId;
    
    private Client clientId;
    
    private String caseStatus;
    
    private Date caseStartDate;
    
    private Date courtHearing;
    
    private String mediator;
    
    private String party1;
    
    private String party2;
    
    private String caseNotes;
    
    private String actionTook;
    
    private String actionNeedToTake;
    
    private Attorney lastUpdateBy;

    private Date lastUpdatedDateTime;

    public int getCaseId() {
        return caseId;
    }

    public void setCaseId(int caseId) {
        this.caseId = caseId;
    }

    public String getCaseName() {
        return caseName;
    }

    public void setCaseName(String caseName) {
        this.caseName = caseName;
    }

    public CaseType getCaseTypeId() {
        return caseTypeId;
    }

    public void setCaseTypeId(CaseType caseTypeId) {
        this.caseTypeId = caseTypeId;
    }

    public Client getClientId() {
        return clientId;
    }

    public void setClientId(Client clientId) {
        this.clientId = clientId;
    }

    public String getCaseStatus() {
        return caseStatus;
    }

    public void setCaseStatus(String caseStatus) {
        this.caseStatus = caseStatus;
    }

    public Date getCaseStartDate() {
        return caseStartDate;
    }

    public void setCaseStartDate(Date caseStartDate) {
        this.caseStartDate = caseStartDate;
    }

    public Date getCourtHearing() {
        return courtHearing;
    }

    public void setCourtHearing(Date courtHearing) {
        this.courtHearing = courtHearing;
    }

    public String getMediator() {
        return mediator;
    }

    public void setMediator(String mediator) {
        this.mediator = mediator;
    }

    public String getParty1() {
        return party1;
    }

    public void setParty1(String party1) {
        this.party1 = party1;
    }

    public String getParty2() {
        return party2;
    }

    public void setParty2(String party2) {
        this.party2 = party2;
    }

    public String getCaseNotes() {
        return caseNotes;
    }

    public void setCaseNotes(String caseNotes) {
        this.caseNotes = caseNotes;
    }

    public String getActionTook() {
        return actionTook;
    }

    public void setActionTook(String actionTook) {
        this.actionTook = actionTook;
    }

    public String getActionNeedToTake() {
        return actionNeedToTake;
    }

    public void setActionNeedToTake(String actionNeedToTake) {
        this.actionNeedToTake = actionNeedToTake;
    }

    public Attorney getLastUpdateBy() {
        return lastUpdateBy;
    }

    public void setLastUpdateBy(Attorney lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy;
    }

    public Date getLastUpdatedDateTime() {
        return lastUpdatedDateTime;
    }

    public void setLastUpdatedDateTime(Date lastUpdatedDateTime) {
        this.lastUpdatedDateTime = lastUpdatedDateTime;
    }
    
    
    
}
