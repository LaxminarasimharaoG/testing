
package Model;

import java.util.Date;


public class CaseType {
    
    private int caseTypeId;
    
    private String caseType;
    
    private String description;
    
    private String lastUpdatedBy;
    
    private Date lastUpdatedDateTime;

    public int getCaseTypeId() {
        return caseTypeId;
    }

    public void setCaseTypeId(int caseTypeId) {
        this.caseTypeId = caseTypeId;
    }

    public String getCaseType() {
        return caseType;
    }

    public void setCaseType(String caseType) {
        this.caseType = caseType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(String lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public Date getLastUpdatedDateTime() {
        return lastUpdatedDateTime;
    }

    public void setLastUpdatedDateTime(Date lastUpdatedDateTime) {
        this.lastUpdatedDateTime = lastUpdatedDateTime;
    }
    
}
