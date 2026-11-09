function calculateLoan(LoanAmount, interestRate, MonthToPay)
{
    if((LoanAmount === '') || (LoanAmount < 0) || (isNaN(LoanAmount))){
        return "Please provide a valid loan amount"; 
    } else if((interestRate === '') || (interestRate < 0) || (isNaN(interestRate))){
        return "Please provide a valid interestRate"; 
    } else if((MonthToPay === '') || (MonthToPay < 0) || (isNaN(MonthToPay))){
        return "Please provide a valid month"; 
    } else {
        const interest = (LoanAmount * (interestRate * 0.01)) / MonthToPay;
        let payment = ((LoanAmount / MonthToPay) + interest).toFixed(2);
        return payment;
    }
}
console.log(calculateLoan(1000,0.1, 12));

module.exports = {
    calculateLoan
}