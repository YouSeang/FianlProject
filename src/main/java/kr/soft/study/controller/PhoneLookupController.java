package kr.soft.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;

import kr.soft.study.service.PhoneLookupService;

@Controller
public class PhoneLookupController {

	@Autowired
	private PhoneLookupService phoneLookupService;

	@GetMapping("/lookup")
    @ResponseBody
    public ResponseEntity<JsonNode> lookupPhoneNumber(@RequestParam("phoneNumber") String phoneNumber) {
        try {
            JsonNode phoneInfo = phoneLookupService.lookupPhoneNumber(phoneNumber);
            return ResponseEntity.ok(phoneInfo);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }

    @GetMapping("/phoneLookupForm")
    public String showPhoneLookupForm() {
        return "security/phoneLookupForm";
    }
}