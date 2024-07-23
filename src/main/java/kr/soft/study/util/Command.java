package kr.soft.study.util;

import org.springframework.ui.Model;

public interface Command {
	void execute(Model model);
}
