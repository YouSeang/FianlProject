package kr.soft.study.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.CriminalVoiceCommand;

@Controller
public class CriminalVoiceController {

	private CriminalVoiceCommand criminalVoiceCommand;

	@Autowired
	public CriminalVoiceController(CriminalVoiceCommand criminalVoiceCommand) {
		this.criminalVoiceCommand = criminalVoiceCommand;
	}

	@RequestMapping("/getVoice")
	@ResponseBody
	public String getVoiceById(@RequestParam("id") String id) {
		if (id == null || id.isEmpty()) {
			return "{\"error\": \"ID parameter is missing\"}";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("id", id);
		return criminalVoiceCommand.execute(model);
	}

	@RequestMapping("/voiceDetail")
	public String voiceDetail() {
		return "voice/voiceDetail";
	}
}
