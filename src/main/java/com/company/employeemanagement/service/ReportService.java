package com.company.employeemanagement.service;

import org.springframework.stereotype.Service;

@Service
public class ReportService {

    public String generateMonthlyPayrollReport(String month) {
        return "payroll_" + month.toLowerCase() + ".pdf";
    }
}
