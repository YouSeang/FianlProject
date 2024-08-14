package kr.soft.study.dto;

public class RentSettingsDTO {
    private int id;
    private String propertyType;
    private double percentage;
    private String housePriceTerm;
    private String mortgageAmountTerm;
    private String totalOtherDepositTerm;
    private String rentPriceTerm;
    
    // Getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getPropertyType() {
        return propertyType;
    }
    public void setPropertyType(String propertyType) {
        this.propertyType = propertyType;
    }
    public double getPercentage() {
        return percentage;
    }
    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }
    public String getHousePriceTerm() {
        return housePriceTerm;
    }
    public void setHousePriceTerm(String housePriceTerm) {
        this.housePriceTerm = housePriceTerm;
    }
    public String getMortgageAmountTerm() {
        return mortgageAmountTerm;
    }
    public void setMortgageAmountTerm(String mortgageAmountTerm) {
        this.mortgageAmountTerm = mortgageAmountTerm;
    }
    public String getTotalOtherDepositTerm() {
        return totalOtherDepositTerm;
    }
    public void setTotalOtherDepositTerm(String totalOtherDepositTerm) {
        this.totalOtherDepositTerm = totalOtherDepositTerm;
    }
    public String getRentPriceTerm() {
        return rentPriceTerm;
    }
    public void setRentPriceTerm(String rentPriceTerm) {
        this.rentPriceTerm = rentPriceTerm;
    }
}
