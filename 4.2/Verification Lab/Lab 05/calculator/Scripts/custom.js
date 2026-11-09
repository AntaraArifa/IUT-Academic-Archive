// Custom Calculator: Compound Interest + Installment Plan
// This module integrates BOTH the Basic module and the Advanced module.

const basicModule = typeof require !== "undefined" ? require("./basic") : window.basic;
const advancedModule = typeof require !== "undefined" ? require("./advanced") : window.advanced;

function validateNumber(value, name) {
  if (!Number.isFinite(value)) {
    throw new Error(`${name} must be a valid number`);
  }
}

/**
 * Calculates compound interest.
 * amount = principal * (1 + rate/100) ^ time
 * Uses: basic.divide, basic.add, advanced.pow, basic.multiply, basic.subtract
 */
function compoundInterest(principal, ratePercent, time) {
  validateNumber(principal, "Principal");
  validateNumber(ratePercent, "Rate");
  validateNumber(time, "Time");

  if (principal < 0 || ratePercent < 0 || time < 0) {
    throw new Error("Principal, rate, and time must be non-negative");
  }

  const rateDecimal = basicModule.divide(ratePercent, 100);
  const base = basicModule.add(1, rateDecimal);
  const growthFactor = advancedModule.pow(base, time);
  const amount = basicModule.multiply(principal, growthFactor);
  const interest = basicModule.subtract(amount, principal);

  return {
    amount: Math.round(amount * 100) / 100,
    interest: Math.round(interest * 100) / 100,
  };
}

/**
 * Splits a total amount into equal monthly installments and reports
 * any leftover remainder after rounding each installment to the cent.
 * Uses: basic.divide, basic.multiply, basic.subtract, advanced.modulo
 */
function installmentPlan(totalAmount, months) {
  validateNumber(totalAmount, "Total amount");
  validateNumber(months, "Months");

  if (!Number.isInteger(months)) {
    throw new Error("Number of months must be an integer");
  }
  if (months <= 0) {
    throw new Error("Number of months must be greater than 0");
  }
  if (totalAmount < 0) {
    throw new Error("Total amount must be non-negative");
  }

  const rawInstallment = basicModule.divide(totalAmount, months);
  const installment = Math.floor(rawInstallment * 100) / 100;
  const totalPaidInFullInstallments = basicModule.multiply(installment, months);
  const remainder = basicModule.subtract(totalAmount, totalPaidInFullInstallments);

  const installmentInCents = Math.round(installment * 100) || 1;
  const remainderCheck = advancedModule.modulo(
    Math.round(totalAmount * 100),
    installmentInCents
  );

  return {
    installment,
    remainder: Math.round(remainder * 100) / 100,
    remainderCheck,
  };
}

const customCalculator = { compoundInterest, installmentPlan };

if (typeof module !== "undefined" && module.exports) {
  module.exports = customCalculator;
}
if (typeof window !== "undefined") {
  window.custom = customCalculator;
}
