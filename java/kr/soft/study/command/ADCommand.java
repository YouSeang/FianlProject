package kr.soft.study.command;

import java.util.Map;

import org.springframework.ui.Model;

public interface ADCommand {
	
	public void execute(Model model);

	void execute(Map<String, Object> model);

}
