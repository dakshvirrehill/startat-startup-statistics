package model;

public class Financials {
	int FinancialId,CompanyId,FinancialAmount,Month,Year,sales;
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getFinancialId() {
		return FinancialId;
	}
	public void setFinancialId(int financialId) {
		FinancialId = financialId;
	}
	public int getCompanyId() {
		return CompanyId;
	}
	public void setCompanyId(int companyId) {
		CompanyId = companyId;
	}
	public int getFinancialAmount() {
		return FinancialAmount;
	}
	public void setFinancialAmount(int financialAmount) {
		FinancialAmount = financialAmount;
	}
	public int getMonth() {
		return Month;
	}
	public void setMonth(int month) {
		Month = month;
	}
	public int getYear() {
		return Year;
	}
	public void setYear(int year) {
		Year = year;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFinancial_Type() {
		return Financial_Type;
	}
	public void setFinancial_Type(String financial_Type) {
		Financial_Type = financial_Type;
	}
	public String getFinancial_Name() {
		return Financial_Name;
	}
	public void setFinancial_Name(String financial_Name) {
		Financial_Name = financial_Name;
	}
	String date,Financial_Type,Financial_Name;
}
