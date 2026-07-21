package com.company.employeemanagement.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/departments")
public class DepartmentController {

    @GetMapping
    public String getAllDepartments() {
        return "[\"Engineering\", \"HR\", \"Sales\", \"Finance\", \"Marketing\", \"Support\"]";
    }
}
