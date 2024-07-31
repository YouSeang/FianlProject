package kr.soft.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.CriminalVoiceCommand;
import kr.soft.study.command.GetAllScenariosCommand;
import kr.soft.study.dto.Scenario;

@Controller
public class CriminalVoiceController {

	private CriminalVoiceCommand criminalVoiceCommand;
	
	// 세앙 추가 -> 시나리오 이름 가져와서 버튼 생성
	private GetAllScenariosCommand getAllScenariosCommand;

	@Autowired
	public CriminalVoiceController(CriminalVoiceCommand criminalVoiceCommand, GetAllScenariosCommand getAllScenariosCommand) {
		this.criminalVoiceCommand = criminalVoiceCommand;
		this.getAllScenariosCommand = getAllScenariosCommand;
	}

	@RequestMapping("/getVoice")
	@ResponseBody
	public String getVoiceById(@RequestParam("id") String id, @RequestParam("scenarioName") String scenarioName) {
		if (id == null || id.isEmpty()) {
			return "{\"error\": \"ID parameter is missing\"}";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("id", id);
		model.put("scenarioName", scenarioName);
		return criminalVoiceCommand.execute(model);
	}
	
	// 세앙 추가
	@RequestMapping("/voice/newVoicePhishing")
	public String openVoicePhishing(Model model) {
		List<Scenario> scenarios = getAllScenariosCommand.execute();
		model.addAttribute("scenarios", scenarios);
		return "voice/newVoicePhishing";
	}

	@RequestMapping("/voiceDetail")
	public String voiceDetail() {
		return "voice/voiceDetail";
	}
}
