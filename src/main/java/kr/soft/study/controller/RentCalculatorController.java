package kr.soft.study.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.dao.RentSettingsDAO;
import kr.soft.study.dto.RentSettingsDTO;

@Controller
public class RentCalculatorController {

    @Autowired
    private RentSettingsDAO rentSettingsDAO;

    // This method should remain a GET if it's used to show the calculator form
    @GetMapping("/calculate")
    public String showCalculator(Model model) {
        model.addAttribute("apartmentSettings", rentSettingsDAO.getSettingsByPropertyType("apartment"));
        model.addAttribute("villaSettings", rentSettingsDAO.getSettingsByPropertyType("villa"));
        return "security/calculate";
    }

    // This method should be POST to handle the form submission
    @PostMapping("/calculate/apartment")
    @ResponseBody
    public Map<String, String> calculateApartmentRent(@RequestParam("housePrice") double housePrice,
                                                      @RequestParam("mortgageAmount") double mortgageAmount,
                                                      @RequestParam("rentPrice") double rentPrice) {
        RentSettingsDTO settings = rentSettingsDAO.getSettingsByPropertyType("apartment");
        double threshold = housePrice * (settings.getPercentage() / 100) - mortgageAmount;
        Map<String, String> response = new HashMap<>();
        
        if (threshold < rentPrice) {
            response.put("result", String.format("%s 유의하세요", settings.getRentPriceTerm()));
        } else {
            response.put("result", String.format("%s 적절한 전세가입니다", settings.getRentPriceTerm()));
        }
        return response;
    }

    @PostMapping("/calculate/villa")
    @ResponseBody
    public Map<String, String> calculateVillaRent(@RequestParam("housePrice") double housePrice,
                                                  @RequestParam("mortgageAmount") double mortgageAmount,
                                                  @RequestParam("totalOtherDepositAmount") double totalOtherDepositAmount,
                                                  @RequestParam("rentPrice") double rentPrice) {
        RentSettingsDTO settings = rentSettingsDAO.getSettingsByPropertyType("villa");
        double threshold = (housePrice * (settings.getPercentage() / 100)) - mortgageAmount - totalOtherDepositAmount;
        Map<String, String> response = new HashMap<>();
        
        if (threshold < rentPrice) {
            response.put("result", String.format("%s 유의하세요", settings.getRentPriceTerm()));
        } else {
            response.put("result", String.format("%s 적절한 전세가입니다", settings.getRentPriceTerm()));
        }
        return response;
    }

}
